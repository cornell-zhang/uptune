//===========================================================================
// layer.h
//===========================================================================
// @brief: This header file defines the interface for the core functions.

#ifndef COMMON_LAYERS
#define COMMON_LAYERS

#include "typedefs.h"

// Constants used for BNN configuration
const int I_WIDTH1 = 16; //conv1 input width
const int N_CHANNEL1 = 16; // conv1 output channels
const int I_WIDTH2 = 8; //conv2 input width
const int N_CHANNEL2 = 32; // conv12 output channels
const int O_WIDTH = 4; //conv output width
const int F = 3; //filter width
const int FILTER_SIZE = F*F;
const int PADDING = F - 1;
const int MAX_FMAP = 5184; //18*18*16
const int MAX_F = 32; //{16, 32} num of conv2 output fmaps
const int MAX_W_CONV = 4608;//3*3*16*32 num of conv2 weights
const int FC1_UNITS = O_WIDTH*O_WIDTH*N_CHANNEL2; //num of fc1 input units
const int FC2_UNITS = 256;
const int MAX_W_FC = FC1_UNITS*FC2_UNITS;
const int OUT = 10;
const int BUS_WIDTH = 32;

// Padding the input feature map
void pad(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int I);

// Reduce the size of feature map
void max_pool(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int I);

// Reshape the conv laper output to dense layer input
void reshape(bit* input, bit* output);

// Perform dense layer
void dense_1(bit* input, bit* output, int M, int N);
void dense_2(bit* input, bit* output, int M, int N);

// popcount
int popcount_32(bit32_t x);
#endif
