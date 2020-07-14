#include "common_layers.h"
#include "model.h"
#include <cmath>
#include <iostream>

using namespace std;

// helper function to neglect padding pixels
inline bool if_mac(int x, int y, int I)
{
        if (x < PADDING / 2 || x >= (I - PADDING / 2) || y < PADDING / 2 || y >= (I - PADDING / 2))
                return false;
        return true;
}


//----------------------------------------------------------
// Padding
//----------------------------------------------------------
// @param[in] : input - input fmaps
//              M - number of input fmaps
//              I - width of input fmaps
// @param[out] : output - output fmaps

void pad(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int I) {
  int ifmap_size = I * I;
  int ofmap_size = (I+PADDING) * (I+PADDING);

  for (int i = 0; i < MAX_FMAP; i++) output[i] = 0;

  for (int m = 0; m < M; m++) {
    for (int x = 0; x < I; x++) {
      for (int y = 0; y < I; y++) {
        int i_index = x + y*I + m*ifmap_size;
        int o_index = (x + PADDING/2) + (y + PADDING/2)*(I + PADDING) + m*ofmap_size;
        output[o_index] = input[i_index];
      }
    }
  }
}

//----------------------------------------------------------
// Max pooling
//----------------------------------------------------------
// @param[in] : input - input fmaps
//              M - number of input fmaps
//              I - width of input fmaps
// @param[out] : output - output fmaps

void max_pool(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int I){
  int O = I / 2;
  int ifmap_size = I * I;
  int ofmap_size = O * O;

  for (int i = 0; i < MAX_FMAP; i++) output[i] = 0;

  for (int m = 0; m < M; m++){
    for (int x = 0; x < O; x++){
      for (int y = 0; y < O; y++){
        int o_index = x + y * O + m * ofmap_size;
        bit max = 0;
        for (int c = 0; c < 2; c++){
          for (int r = 0; r < 2; r++){
            int i_index = 2 * x + c + (2 * y + r) * I + m * ifmap_size;
            if (input[i_index]) max = 1; //this is because bit 1 is represented as 0xff memory
          }
        }
        output[o_index] = max;
      }
    }
  }
}

int popcount_32(bit32_t x) {
  const bit32_t m1  = 0x55555555;
  const bit32_t m2  = 0x33333333;
  const bit32_t m3  = 0x0f0f0f0f;
  const bit32_t m4  = 0x00ff00ff;
  const bit32_t m5  = 0x0000ffff;
  x = (x & m1 ) + ((x >> 1) & m1 );
  x = (x & m2 ) + ((x >> 2) & m2 );
  x = (x & m3 ) + ((x >> 4) & m3 );
  x = (x & m4 ) + ((x >> 8) & m4 );
  x = (x & m5 ) + ((x >> 16) & m5 );
  return x;
}

//----------------------------------------------------------
// Perform Dense Layer
//----------------------------------------------------------
// @param[in] : input - input fmaps
//              M - number of input fmaps
//              N - number of output fmaps
// @param[out] : output - output fmaps

void dense_1(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int N){
  float var_w = 2. / M;
  float c = sqrt(var_w);

  // Input units (M) is 512
  bit32_t packed_input[512 / 32];
  LOOP_PACK_INPUT_X: for (int x = 0; x < 512 / 32; x++){
    #pragma HLS unroll
    LOOP_PACK_INPUT_Y: for (int y = 0; y < 32; y++){
      int i_index = x * 32 + y;
      packed_input[x](y,y) = input[i_index];
    }
  }

  for (int n = 0; n < N; n++){
    #pragma HLS pipeline
    float one_out = 0;
    for (int m = 0; m < M / 32; m++) {
      int packed_w_index = m * N + n;
      one_out += popcount_32(~(packed_input[m] ^ packed_w_fc1[packed_w_index])); //XNOR
    }
    one_out = (2 * one_out - M)*c;
    float biased = one_out + b_fc1[n];
    output[n] = (biased > 0) ? 1 : 0;
  }
}

void dense_2(bit input[MAX_FMAP], bit output[MAX_FMAP], int M, int N){
  float var_w = 2. / M;
  float c = sqrt(var_w);
  float max = -100;

  // Input units (M) is 256
  bit32_t packed_input[256 / 32];
  LOOP_PACK_INPUT_X: for (int x = 0; x < 256 / 32; x++){
    #pragma HLS unroll
    LOOP_PACK_INPUT_Y: for (int y = 0; y < 32; y++){
      int i_index = x * 32 + y;
      packed_input[x](y,y) = input[i_index];
    }
  }
}


//----------------------------------------------------------
// Reshpae the Output from Conv Layer
//----------------------------------------------------------
// @param[in] : input - output fmaps from the last conv layer
// @param[out] : output - input famps of the first dense layer

void reshape(bit* input, bit* output) {
  for (int c = 0; c < N_CHANNEL2; c++) {
    for (int y = 0; y < O_WIDTH; y++) {
      for (int x = 0; x < O_WIDTH; x++) {
        int o_index = c + (x + y * O_WIDTH ) * N_CHANNEL2;
        int i_index = x + y * O_WIDTH + c * O_WIDTH*O_WIDTH;
        output[o_index] = input[i_index];
      }
    }
  }
}

