//===========================================================================
// bnn.h
//===========================================================================
// @brief: This header file defines the interface for the core functions.

#ifndef BNN
#define BPNN
#include "common_layers.h"
#include "conv.h"
#include "dense.h"
#include "typedefs.h"
#include <hls_stream.h>

// Top function for synthesis
//void dut (
//  hls::stream<bit32_t> &strm_in,
//  hls::stream<bit> &strm_out
//);

void dut (
  hls::stream<bit32_t> &strm_in,
  hls::stream<bit32_t> &strm_out
);

// Top function for bnn accelerator
//void bnn_xcel(bit input[MAX_FMAP], bit mem_conv2[MAX_FMAP]);
void bnn_xcel_hcl(bit input[MAX_FMAP], bit mem_conv2[MAX_FMAP]);

#endif
