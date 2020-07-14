//==========================================================================
// bnn.cpp
//==========================================================================
// @brief: A convolution kernel for CNN on digit recognition

#include "common_layers.h"
#include "model.h"
#include "bnn.h"
#include <fstream>
#include <iostream>
#include <iomanip>

using namespace std;

//----------------------------------------------------------
// Top function
//----------------------------------------------------------

void dut(
    hls::stream<bit32_t> &strm_in,
    hls::stream<bit32_t> &strm_out
)
{
  bit input[MAX_FMAP];
  bit32_t input_l;
  bit output[MAX_FMAP];

  for (int i = 0; i < I_WIDTH1 * I_WIDTH1 / BUS_WIDTH; i++) {
     input_l = strm_in.read();
     for (int j = 0; j < BUS_WIDTH; j++) {
       input[i*BUS_WIDTH+j] = input_l(j,j);
     }
  }

  bnn_xcel_hcl(input, output);
  int outWH = I_WIDTH1 + PADDING - F + 1;
  int output_size = N_CHANNEL1 * outWH * outWH;

  for(int i=0; i<4096; i++)
    strm_out.write(output[i]);
}


//----------------------------------------------------------
// BNN Accelerator
//----------------------------------------------------------
// @param[in] : input - the testing instance
// @return : the predicted digit

void bnn_xcel_hcl(bit input[MAX_FMAP], bit mem_conv2[MAX_FMAP]){
  bit mem_conv1[MAX_FMAP];

  /* First Conv Layer */
  pad(input, mem_conv1, 1, I_WIDTH1);
  conv_hcl(mem_conv1, w_conv1, threshold1, mem_conv2);
  max_pool(mem_conv2, mem_conv1, N_CHANNEL1, I_WIDTH1);

  /* Second Conv Layer */
  pad(mem_conv1, mem_conv2, N_CHANNEL1, I_WIDTH2);
  conv_hcl2(mem_conv2, w_conv2, threshold2, mem_conv1);
  max_pool(mem_conv1, mem_conv2, N_CHANNEL2, I_WIDTH2);

  reshape(mem_conv2, mem_conv1);
  
  dense_hcl(mem_conv1, w_fc1, b_fc1, mem_conv2);
  dense_hcl2(mem_conv2, w_fc2, b_fc2, mem_conv1);
  mem_conv2 = mem_conv1;
  //dense_1(mem_conv1, mem_conv2, FC1_UNITS, FC2_UNITS);
  //dense_2(mem_conv2, mem_conv1, FC2_UNITS, 10);
}



