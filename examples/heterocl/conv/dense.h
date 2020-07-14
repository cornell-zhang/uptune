#ifndef DENSE
#define DENSE

#include <ap_int.h>
#include <ap_fixed.h>
#include "typedefs.h"


// dense layers generated by hcl code generator
void dense_hcl(bit input[MAX_FMAP], const bit W_dense[MAX_W_CONV], const float* bias, bit output[MAX_FMAP]);

// 2nd dense layers generated by hcl
void dense_hcl2(bit input[MAX_FMAP], const bit W_dense[MAX_W_CONV], const float* bias, bit output[MAX_FMAP]);

#endif