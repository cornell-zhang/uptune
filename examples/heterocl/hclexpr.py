#!/usr/bin/env python

# -------------------------------------
# Examples for auto-tuning HeteroCL BNN
# --------------------------------------

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import heterocl as hcl
import numpy as np
import subprocess, os

# whether use data packing in conv layer
PACKING = True # {% PACKING=TuneBool(True, ()) %}

# ------------------------------------------------------
# func to generate CONV layer HLSC (first layer default)
# -----------------------------------------------------
def conv(layer, save=True):
    if layer == 1:
        inf=1
        outf=16
        width=16 
        factor=1
        outfile='hcl_code_generator'
    else:
        inf=16
        outf=32
        width=8 
        factor=16
        outfile='hcl_code_generator2'

    I_WIDTH = width
    F = 3
    PADDING = F - 1
    in_fmaps = inf
    out_fmaps = outf
    I = I_WIDTH + PADDING
    O = I - F + 1

    def packed_conv2d(fmaps, filters, bias, pack_factor=factor, dtype=hcl.UInt(32)):
        # fmaps = [16,X,Y], filters = [16,1,3,3] or [32,16,3,3]
        def pack(A, pack_factor):
            return hcl.pack(A, factor=pack_factor, name="PackedNumber")
        def extract_vector(A, xx, yy):
            # channels_first
            return hcl.compute((A.shape[0],), lambda x: A[x, xx, yy], dtype=hcl.UInt(1),name="ExtractedVector")
        def extract_window(A, xx, yy):
            # always return a 3-dimensional 3x3 tensor
            if len(A.shape) == 2:
                return hcl.compute(
                    (1,3,3),
                    lambda z, x, y: A[z, xx+x, yy+y],
                    dtype=A.dtype,
                    name="Window"
                )
            else:
                return hcl.compute(
                    (A.shape[0],3,3),
                    lambda z, x, y: A[z, xx+x, yy+y],
                    dtype=A.dtype,
                    name="Window"
                )
        def extract_filter(A, c):
            return hcl.compute(
                (A.shape[1], A.shape[2], A.shape[3]),
                lambda zz, xx, yy: A[c, zz, xx, yy],
                dtype=A.dtype,
                name="ExtractedFilter"
            )
        def extract_and_pack(A, pack_factor=pack_factor):
            pack_factor = pack_factor//1
            assert len(A.shape) == 3, "Can only handle three dimensional input tensors."
            assert pack_factor >= 1 and pack_factor <= 64, "pack_factor should be in the range [1,65)"
            assert pack_factor <= A.shape[0], "Can not pack a tensor with a factor larger than its shape."
            return hcl.compute(
                (A.shape[0]//pack_factor, A.shape[1], A.shape[2]),
                lambda cc, xx, yy: 
                    pack(extract_vector(A, xx, yy), pack_factor)[cc],
                dtype=hcl.UInt(pack_factor),
                name="PackedTensor"
            )
        def bitwise_and(A, B):
            # A and B should have same dimensions
            assert A.shape == B.shape, "Input tensors of bitwise_and have different dimensions."
            # A and B should have same data types
            assert A.dtype == B.dtype, "Input tensors of bitwise_and have different data types."
            return hcl.compute(
                A.shape,
                lambda zz, xx, yy: A[zz, xx, yy] & B[zz, xx, yy],
                dtype=A.dtype,
                name="BitwiseAnd"
            )
        def sum_up(A, dtype=dtype):
            assert len(A.shape) < 4, "sum_up function can not handle a tensor having more than 3 dimensions."
            ax0 = hcl.reduce_axis(0, A.shape[0])
            ax1 = hcl.reduce_axis(0, A.shape[1]) if len(A.shape)>1 else None
            ax2 = hcl.reduce_axis(0, A.shape[2]) if len(A.shape)>2 else None
            if ax1 == None:
                return hcl.compute((1,), lambda x: hcl.sum(A[x+ax0], axis=[ax0]), dtype=dtype, name="SumUp")
            elif ax2 == None:
                return hcl.compute((1,1), lambda x, y: hcl.sum(A[x+ax0, y+ax1], axis=[ax0, ax1]), dtype=dtype, name="SumUp")
            else:
                return hcl.compute((1,1,1), lambda x, y, z: hcl.sum(A[x+ax0, y+ax1, z+ax2], axis=[ax0, ax1, ax2]), dtype=dtype, name="SumUp")
        def popcnt(num, bits, dtype=dtype):
            out = hcl.local(0, dtype=dtype)
            with hcl.for_(0, bits) as i:
                # Bit selection operation
                out[0] += num[i]
            return out[0]
        def calc_popcnt(A, dtype=dtype):
            return hcl.compute(
                A.shape, 
                lambda z, x, y: popcnt(A[z, x, y], bits=pack_factor, dtype=dtype), 
                dtype=dtype, 
                name="PopCNT"
            )
        def pipeline(): 
            assert fmaps.shape[0]==filters.shape[1], "number of kernels in a filter doesn't match the number of channels in the feature maps"
            assert (bias.shape[0], bias.shape[1], bias.shape[2])==(filters.shape[0],fmaps.shape[1]-2,fmaps.shape[2]-2), "bias shape doesn't match"
            packed_fmaps = extract_and_pack(fmaps)
            return hcl.compute(
                (filters.shape[0], fmaps.shape[1]-2, fmaps.shape[2]-2),
                lambda cc, xx, yy:
                    hcl.select(sum_up(calc_popcnt(bitwise_and(extract_window(packed_fmaps, xx, yy), extract_and_pack(extract_filter(filters, cc)))))[0,0,0]>bias[cc,xx,yy], 1, 0),
                dtype=hcl.UInt(1),
                name="Result"
            )

        return pipeline()

    # using the data packing
    if PACKING: 
        threshold = hcl.placeholder((out_fmaps, O, O), dtype=hcl.Int(8), name="threshold")
        # A is the input feature maps
        A = hcl.placeholder((in_fmaps, I, I), dtype=hcl.UInt(1), name="input")
        # B is the weights matrix -> filter
        B = hcl.placeholder((out_fmaps, in_fmaps, F, F), dtype=hcl.UInt(1), name="W_conv")
        s = hcl.create_schedule([A, B, threshold], packed_conv2d)

    # vanilla conv implementation with hcl
    else:
        threshold = hcl.placeholder((1, out_fmaps, O, O), dtype=hcl.Int(8), name="threshold")
        # A is the input feature maps
        A = hcl.placeholder((1, in_fmaps, I, I), dtype=hcl.UInt(1), name="input")
        # B is the weights matrix -> filter
        B = hcl.placeholder((out_fmaps, in_fmaps, F, F), dtype=hcl.UInt(1), name="W_conv")
        rc = hcl.reduce_axis(0, in_fmaps)
        ry = hcl.reduce_axis(0, F)
        rx = hcl.reduce_axis(0, F)
        C = hcl.compute((1, out_fmaps, O, O),
            lambda nn, ff, yy, xx:
                hcl.select(hcl.sum(A[nn, rc, yy + ry, xx + rx] * B[ff, rc, ry, rx], axis=[rc, ry, rx])>threshold[nn, ff, yy, xx], 1, 0 ),
            dtype=hcl.UInt(1),
            name="output")
        s = hcl.create_schedule([A, B, threshold, C])

    '''
    ------------------------------
    Add scheduling techniques here
    for conv1/conv2 seperately
    ------------------------------
    '''
    if outfile == 'hcl_code_generator':
      # ------------------------
      # scheduling for conv1
      # ------------------------
      if PACKING:
          depth = 0 # {% depth=TuneInt(2, (0,2)) %}
          s[packed_conv2d.Result].pipeline(packed_conv2d.Result.axis[depth])
      else:
          # {% factor=TuneInt(5, (1,12)) %}
          s[C].split(C.axis[1], factor=5) 
          depth = 0 # {% depth=TuneInt(2, (0,2)) %}
          s[C].pipeline(C.axis[depth]) 
    else:
      # ------------------------
      # scheduling for conv2
      # ------------------------
      if PACKING:
          depth = 0 # {% depth=TuneInt(2, (0,2)) %}
          s[packed_conv2d.Result].pipeline(packed_conv2d.Result.axis[depth])
      else:
          # {% factor=TuneInt(2, (1,12)) %}
          s[C].split(C.axis[1], factor=12) 
          depth = 0 # {% depth=TuneInt(2, (0,2)) %}
          s[C].pipeline(C.axis[depth]) 

    code = hcl.build(s, target='vhls')

    if save == True:
        myfile = open(outfile, "w")
        myfile.write(code)
        myfile.close()
        print("Save the code.")
    else:
        print(code)


# ------------------------------------------
# func to generate DENSE layer HLSC (first layer default)
# -----------------------------------------------------
def dense(layer, save=True):
    if layer == 1:
        in_fmaps = 512
        out_fmaps = 256
        outfile='hcl_code_dense'
    else:
        in_fmaps = 256
        out_fmaps = 10
        outfile='hcl_code_dense2'

    def packed_2d(features, weights, bias, pack_factor=32, dtype=hcl.UInt(32)):
        def transpose(A):
            return hcl.compute((A.shape[1], A.shape[0]), lambda xx, yy: A[yy, xx], dtype=hcl.UInt(1))
        def pack(A, pack_factor):
            return hcl.pack(A, factor=pack_factor)
        def extract_vector(A, xx):
            # extract one row in the matrix
            return hcl.compute((A.shape[1],), lambda x: A[xx, x], dtype=A.dtype)
        def extract_and_pack(A, pack_factor=pack_factor):
            pack_factor = pack_factor//1
            assert len(A.shape) == 2, "Can only handle two dimensional input tensors."
            assert pack_factor >= 1 and pack_factor <= 64, "pack_factor should be in the range [1,65)"
            assert pack_factor <= A.shape[1], "Can not pack a tensor with a factor larger than its shape."
            return hcl.compute(
                (A.shape[0], A.shape[1]//pack_factor),
                lambda xx, yy:
                    pack(extract_vector(A, xx), pack_factor)[yy],
                dtype=hcl.UInt(pack_factor)
            )
        def bitwise_xnor(A, B):
            # A and B should have same dimensions
            assert A.shape == B.shape, "Input tensors of bitwise_and have different dimensions."
            # A and B should have same data types
            assert A.dtype == B.dtype, "Input tensors of bitwise_and have different data types."
            if len(A.shape) == 2:
                return hcl.compute(
                    A.shape,
                    lambda xx, yy: A[xx, yy] == B[xx, yy],
                    dtype=A.dtype
                )
            else:
                return hcl.compute(
                    A.shape,
                    lambda xx: A[xx] & B[xx],
                    dtype=A.dtype
                )
        def sum_up(A, dtype=dtype):
            assert len(A.shape) < 4, "sum_up function can not handle a tensor having more than 3 dimensions."
            ax0 = hcl.reduce_axis(0, A.shape[0])
            ax1 = hcl.reduce_axis(0, A.shape[1]) if len(A.shape)>1 else None
            ax2 = hcl.reduce_axis(0, A.shape[2]) if len(A.shape)>2 else None
            if ax1 == None:
                return hcl.compute((1,), lambda x: hcl.sum(A[x+ax0], axis=[ax0]), dtype=dtype)
            elif ax2 == None:
                return hcl.compute((1,1), lambda x, y: hcl.sum(A[x+ax0, y+ax1], axis=[ax0, ax1]), dtype=dtype)
            else:
                return hcl.compute((1,1,1), lambda x, y, z: hcl.sum(A[x+ax0, y+ax1, z+ax2], axis=[ax0, ax1, ax2]), dtype=dtype)
        def popcnt(num, bits, dtype=dtype):
            out = hcl.local(0, dtype=dtype)
            with hcl.for_(0, bits) as i:
                # Bit selection operation
                out[0] += num[i]
            return out[0]
        def calc_popcnt(A, dtype=dtype):
            if len(A.shape) == 1:
                return hcl.compute(A.shape, lambda x: popcnt(A[x], bits=pack_factor, dtype=dtype), dtype=dtype)
            elif len(A.shape) == 2:
                return hcl.compute(A.shape, lambda x, y: popcnt(A[x, y], bits=pack_factor, dtype=dtype), dtype=dtype)
            else:
                return hcl.compute(A.shape, lambda x, y, z: popcnt(A[x, y, z], bits=pack_factor, dtype=dtype), dtype=dtype)

        def pipeline():
            return hcl.compute(
                (features.shape[0], weights.shape[1]),
                lambda xx, yy:
                    hcl.select(sum_up( calc_popcnt( bitwise_xnor( extract_vector(extract_and_pack(features), xx), extract_vector(extract_and_pack(transpose(weights)), yy) ) ) )[0,0]+bias[xx, yy] > 0, 1, 0),
                dtype=hcl.UInt(1),
                name="D"
            )

        return pipeline()

    # dense layer data packing unable to generate bitstream 
    if False:
        # A is the input feature maps
        A = hcl.placeholder((1, in_fmaps), dtype=hcl.UInt(1), name="input")
        # B is the weights matrix
        B = hcl.placeholder((in_fmaps, out_fmaps), dtype=hcl.UInt(1), name="W_dense")
        # C is the bias array
        C = hcl.placeholder((1, out_fmaps), dtype=hcl.UInt(32), name="bias")
        D = packed_2d(A, B, C)
        s = hcl.create_schedule([A, B, C, D])

    else:
        # A is the input feature maps
        A = hcl.placeholder((1, in_fmaps), dtype=hcl.UInt(1), name="input")
        # B is the weights matrix
        B = hcl.placeholder((in_fmaps, out_fmaps), dtype=hcl.UInt(1), name="W_dense")
        # C is the bias array
        C = hcl.placeholder((out_fmaps,), dtype=hcl.UInt(32), name="bias")

        ri = hcl.reduce_axis(0, in_fmaps)
        D = hcl.compute((1, out_fmaps),
            lambda yy, xx:
                hcl.select( hcl.sum(A[yy, xx] == B[ri, xx], axis=[ri]) + C[xx] > 0, 1, 0 ),
                dtype=hcl.UInt(1),
                name="output")
        s = hcl.create_schedule([A, B, C, D])

    '''
    ------------------------------
    Add scheduling techniques here
    for conv1/conv2 seperately
    ------------------------------
    '''
    if outfile == 'hcl_code_dense':
      # ------------------------
      # scheduling for conv1
      # ------------------------
      # s[D].split(D.axis[1], factor=2)
      depth = 0 # {% depth=TuneInt(2, (0,2)) %}
      s[D].pipeline(D.axis[depth])
      pass
    else:
      # ------------------------
      # scheduling for conv2
      # ------------------------
      # s[D].split(D.axis[1], factor=7)
      depth = 0 # {% depth=TuneInt(2, (0,2)) %}
      s[D].pipeline(D.axis[depth])
      pass

    code = hcl.build(s, target='vhls')

    if save == True:
        myfile = open(outfile, "w")
        myfile.write(code)
        myfile.close()
        print("Save the code.")
    else:
        print(code)


# --------------------------------------------
# parse the generated HLSC CONV code into cpp
# --------------------------------------------
def parse_conv(layer):
    outfile = "hcl_code_generator" if layer == 1 else "hcl_code_generator2"
    myfile = open(outfile, "r")
    raw_code = myfile.readlines()
    myfile.close()
    symbol = "/*Symbol*/" if layer == 1 else "/*Symbol2*/"
    convName = "conv_hcl" if layer == 1 else "conv_hcl2"
    code = []
    for i in raw_code:
        if "#include" not in i:
            if "default_function" in i:
                i = i.replace("default_function", convName)
            if "ap_uint<1>* input" in i:
                i = i.replace("ap_uint<1>* input", "bit input[MAX_FMAP]")
            if "ap_uint<1>* W_conv" in i:
                i = i.replace("ap_uint<1>* W_conv", "const bit W_conv[MAX_W_CONV]")
            if "char* threshold" in i:
                i = i.replace("char* threshold", "const bit8_t threshold[MAX_FMAP]")
            if "ap_uint<1>* output" in i:
                i = i.replace("ap_uint<1>* output", "bit output[MAX_FMAP]")
            if "local0[0]" in i:
                i = i.replace("local0[0]", "local0")
            if "local1[0]" in i:
                i = i.replace("local1[0]", "local1")
            if "int34" in i:
                i = i.replace("int34", "ap_uint<34>")
            if "unsigned char" in i:
                i = i.replace("unsigned char", "ap_uint<8>")
            if "unsigned short" in i:
                i = i.replace("unsigned short", "ap_uint<16>")
            if "local1((i + 1), i) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i))]" in i:
                i = i.replace("local1((i + 1), i) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i))]", "local1((i1), i1) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i1))]")
            if "ap_uint<34>(0))]" in i:
                i = i.replace("ap_uint<34>(0))]", "ap_uint<34>(0))];")
            if "ap_uint<34>(i))]" in i:
                i = i.replace("ap_uint<34>(i))]", "ap_uint<34>(i))];")
            if "ap_uint<34>(i1))]" in i:
                i = i.replace("ap_uint<34>(i1))]", "ap_uint<34>(i1))];")
            if "+ 1)" in i:
                i = i.replace("+ 1)", ")")
            if "ap_uint<1>*" in i:
                i = i.replace("ap_uint<1>*", "ap_uint<8>*")

            # fix for new hlsc
            if "ap_int<8>* threshold" in i:
                i = i.replace("ap_int<8>* threshold", "const bit8_t threshold[MAX_FMAP]")
     
            code.append(i)


    myfile = open("./conv/conv.cpp", "r")
    conv_code = myfile.readlines()
    myfile.close()

    myfile = open("./conv/conv.cpp", "w")
    for line in conv_code:
        myfile.write(line)
        if symbol in line:
            for i in code:
                myfile.write(i)
            if symbol == "/*Symbol*/":
                myfile.write("\n\n/*Symbol2*/\n")
            break
    myfile.close()
    print("Insert parsed code into conv.cpp .")


# -------------------------------------------
# parse generated CONV code into cpp with data packing
# ------------------------------------------
def parse_conv_dp(layer):
    outfile = "hcl_code_generator" if layer == 1 else "hcl_code_generator2"
    myfile = open(outfile, "r")
    raw_code = myfile.readlines()
    myfile.close()
    symbol = "/*Symbol*/" if layer == 1 else "/*Symbol2*/"
    convName = "conv_hcl" if layer == 1 else "conv_hcl2"
    code = []
    for k in range(len(raw_code)):
        i = raw_code[k]
        if "#include" not in i:
            if "default_function" in i:
                i = i.replace("default_function", convName)
            if "ap_uint<1>* input" in i:
                i = i.replace("ap_uint<1>* input", "bit input[MAX_FMAP]")
            if "ap_uint<1>* W_conv" in i:
                i = i.replace("ap_uint<1>* W_conv", "const bit W_conv[MAX_W_CONV]")
            if "char* threshold" in i:
                i = i.replace("char* threshold", "const bit8_t threshold[MAX_FMAP]")

            if "unsigned char Window[9]" in i:
                i = i.replace("unsigned char Window[9]", "bit Window[9]")
            if "unsigned char BitwiseAnd[9]" in i:
                i = i.replace("unsigned char BitwiseAnd[9]", "bit BitwiseAnd[9]")
            if "unsigned char ExtractedVector" in i:
                i = i.replace("unsigned char ExtractedVector", "bit ExtractedVector")
            if "(( ap_uint<1>*)Window)" in i:
                i = i.replace("(( ap_uint<1>*)Window)", "Window")

            if "unsigned char local0" in i:
                i = i.replace("unsigned char local0", "bit local0")
            if "unsigned char ExtractedFilter[9]" in i:
                i = i.replace("unsigned char ExtractedFilter[9]", "bit ExtractedFilter[9]")
            if "(( ap_uint<1>*)PackedTensor1)" in i:
                i = i.replace("(( ap_uint<1>*)PackedTensor1)", "PackedTensor1")
            if "(( ap_uint<1>*)PackedTensor)" in i:
                i = i.replace("(( ap_uint<1>*)PackedTensor)", "PackedTensor")
            if "ap_uint<8> PackedTensor[324]" in i:
                i = i.replace("ap_uint<8> PackedTensor[324]", "ap_uint<1> PackedTensor[324]")
            if "(( ap_uint<1>*)ExtractedFilter)" in i:
                i = i.replace("(( ap_uint<1>*)ExtractedFilter)", "ExtractedFilter")
            if "(( ap_uint<1>*)BitwiseAnd)" in i:
                i = i.replace("(( ap_uint<1>*)BitwiseAnd)", "BitwiseAnd")

            if "int34" in i:
                i = i.replace("int34", "ap_uint<34>")
            if "unsigned char" in i:
                i = i.replace("unsigned char", "ap_uint<8>")
            if "unsigned short" in i:
                i = i.replace("unsigned short", "ap_uint<16>")
            if "ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))]" in i:
                i = i.replace("ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))]", "ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];")
            if "ExtractedVector[(ap_uint<34>((0*16)) + ap_uint<34>(i))]" in i:
                i = i.replace("ExtractedVector[(ap_uint<34>((0*16)) + ap_uint<34>(i))]", "ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];")
            if "+ 1)" in i:
                i = i.replace("+ 1)", ")")

            if "local0[0]((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];" in i:
                i = i.replace("local0[0]((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];", "local0((0 ), 0) = ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))];")
            if "local1[0]((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];" in i:
                i = i.replace("local1[0]((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];", "local1((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];")
            if "local1[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))]" in i:
                i = i.replace("local1[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))]", "local1[0]((i1 ), i1) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i1))]")
            if "local0((0 ), 0)" in i:
                i = i.replace("local0((0 ), 0)", "local0")
            if "ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))]" in i:
                i = i.replace("ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))]", "ExtractedVector")

            if "local1((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];" in i:
                i = i.replace("local1((0 ), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))]", "local1 = ExtractedVector1")
            if "local0[0]((i ), i) = ExtractedVector" in i:
                i = i.replace("local0[0]((i ), i) = ExtractedVector", "local0 = ExtractedVector")
            if "local1[0]((i1 ), i1) = ExtractedVector[(ap":
                i = i.replace("local1[0]((i1 ), i1) = ExtractedVector[(ap", "local1 = ExtractedVector1[(ap")

            if "ap_uint<1>* Result" in i:
                i = i.replace("ap_uint<1>* Result", "bit Result[MAX_FMAP]")

            if "local3[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];" in i:
                i = i.replace("local3[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];", "local3((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];")
            if "local4[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];" in i:
                i = i.replace("local4[0]((i ), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];", "local4((i1 ), i1) = ExtractedVector1[(ap_uint<34>((0)) + ap_uint<34>(i1))];")

            if "PackedNumber_temp[0](((0 ) - 1), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];" in i:
                i = i.replace("PackedNumber_temp[0](((0 ) - 1), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];", "PackedNumber_temp(((0 ) - 1), 0) = ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))];")
            if "PackedNumber_temp(((0 ) - 1), 0) = ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))];" in i and k == 41:
                i = i.replace("PackedNumber_temp(((0 ) - 1), 0) = ExtractedVector[(ap_uint<34>(0) + ap_uint<34>(0))];", "PackedNumber_temp1(((0 ) - 1), 0) = ExtractedVector1[(ap_uint<34>(0) + ap_uint<34>(0))];") # conv 51
            if "PackedNumber_temp[0](((i ) - 1), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];" in i:
                i = i.replace("PackedNumber_temp[0](((i ) - 1), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];", "PackedNumber_temp(((i ) - 1), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];") # conv 101
            if "PackedNumber_temp(((i ) - 1), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];" in i and k == 50:
                i = i.replace("PackedNumber_temp(((i ) - 1), i) = ExtractedVector[(ap_uint<34>((0)) + ap_uint<34>(i))];", "PackedNumber_temp1(((i1 ) - 1), i1) = ExtractedVector1[(ap_uint<34>((0)) + ap_uint<34>(i1))];") # conv 101

            # fix the threshold pointer reference issue
            if "ap_int<8>* threshold" in i:
                i = i.replace("ap_int<8>* threshold", "const bit8_t threshold[MAX_FMAP]") # conv 101
            if "- 1" in i:
                i = i.replace("- 1", "") 

            code.append(i)

    myfile = open("./conv/conv.cpp", "r")
    conv_code = myfile.readlines()
    myfile.close()

    myfile = open("./conv/conv.cpp", "w")
    for line in conv_code:
        myfile.write(line)
        if symbol in line:
            for i in code:
                myfile.write(i)
            if symbol == "/*Symbol*/":
                myfile.write("\n\n/*Symbol2*/\n")
            break
    myfile.close()
    print("Insert parsed code into conv.cpp .")


# --------------------------------------------
# parse the generated HLSC DENSE code into cpp
# --------------------------------------------
def parse_dense(layer):
    outfile="hcl_code_dense" if layer == 1 else "hcl_code_dense2"
    myfile = open(outfile, "r")
    raw_code = myfile.readlines()
    myfile.close()
    symbol = "/*Symbol*/" if layer == 1 else "/*Symbol2*/"
    denseName = "dense_hcl" if layer == 1 else "dense_hcl2"
    code = []
    for i in raw_code:
        if "#include" not in i:
            if "default_function" in i:
                i = i.replace("default_function", denseName)
            if "ap_uint<1>* input" in i:
                i = i.replace("ap_uint<1>* input", "bit input[MAX_FMAP]")
            if "ap_uint<1>* W_dense" in i:
                i = i.replace("ap_uint<1>* W_dense", "const bit W_dense[MAX_W_CONV]")
            if "unsigned int* bias" in i:
                i = i.replace("unsigned int* bias", "const float* bias")
            if "ap_uint<1>* output" in i:
                i = i.replace("ap_uint<1>* output", "bit output[MAX_FMAP]")

            if "local0[0]" in i:
                i = i.replace("local0[0]", "local0")
            if "local1[0]" in i:
                i = i.replace("local1[0]", "local1")
            if "int34" in i:
                i = i.replace("int34", "ap_uint<34>")
            if "unsigned char" in i:
                i = i.replace("unsigned char", "ap_uint<8>")
            if "unsigned int" in i:
                i = i.replace("unsigned int", "ap_uint<32>")
            if "unsigned short" in i:
                i = i.replace("unsigned short", "ap_uint<16>")
            if "local1((i + 1), i) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i))]" in i:
                i = i.replace("local1((i + 1), i) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i))]", "local1((i1), i1) = compute5[(ap_uint<34>((0*16)) + ap_uint<34>(i1))]")
            if "ap_uint<34>(0))]" in i:
                i = i.replace("ap_uint<34>(0))]", "ap_uint<34>(0))];")
            if "ap_uint<34>(i))]" in i:
                i = i.replace("ap_uint<34>(i))]", "ap_uint<34>(i))];")
            if "ap_uint<34>(i1))]" in i:
                i = i.replace("ap_uint<34>(i1))]", "ap_uint<34>(i1))];")
            if "+ 1)" in i:
                i = i.replace("+ 1)", ")")
            if "ap_uint<1>*" in i:
                i = i.replace("ap_uint<1>*", "ap_uint<8>*")

            if "local1((i ), i) = compute6[(ap_uint<34>((indices*32)) + ap_uint<34>(i))];" in i:
                i = i.replace("local1((i ), i) = compute6[(ap_uint<34>((indices*32)) + ap_uint<34>(i))];", "local1((i1 ), i1) = compute6[(ap_uint<34>((indices*32)) + ap_uint<34>(i1))];")
            if "local1((i1 ), i1) = compute6[(ap_uint<34>((indices*32)) + ap_uint<34>(i1))];" in i:
                i = i.replace("local1((i1 ), i1) = compute6[(ap_uint<34>((indices*32)) + ap_uint<34>(i1))];", "local1((i1 ), i1) = compute6[(ap_uint<34>((indices1*32)) + ap_uint<34>(i1))];")

            # fix dense function bias pointer reference isse
            if "ap_uint<32>* bias" in i:
                i = i.replace("ap_uint<32>* bias", "const float* bias")
            code.append(i)

    myfile = open("./conv/dense.cpp", "r")
    conv_code = myfile.readlines()
    myfile.close()

    myfile = open("./conv/dense.cpp", "w")
    for line in conv_code:
        myfile.write(line)
        if symbol in line:
            for i in code:
                myfile.write(i)
            if symbol == "/*Symbol*/":
                myfile.write("\n\n/*Symbol2*/\n")
            break
    myfile.close()
    print("Insert parsed code into dense.cpp .")


if __name__ == "__main__":
    # generate HLSC code
    conv(1)
    hcl.init()
    conv(2)
    hcl.init()
    dense(1)
    hcl.init()
    dense(2)

    # parse code into cpp. separate parser for data packing
    # no data packing in dense since it won't run through bitstream
    if PACKING:
      parse_conv_dp(1)
      parse_conv_dp(2)
    else:
      parse_conv(1)
      parse_conv(2)
    parse_dense(1)
    parse_dense(2)
   
    # run csim and synthesis
    os.chdir('./conv')
    os.system('make; make vivado')
    os.system('cp -f ./bnn.prj/solution1/syn/report/dut_csynth.rpt ../')
    os.system('cp -f ./bnn.prj/solution1/syn/report/dut_csynth.xml ../')

    # clean the space
    os.chdir('../')
    os.system('rm hcl_code_*')

    from uptune.get_result import vivado_hls
    res = vivado_hls('dut_csynth.xml')  

    # or retrieve feedback iwth other function
    # import uptune
    # res = uptune.dump(func(*args, **kwargv))

