/*OpenCL C x86-64-linux-avx-avx2-avx512-avx512_skylake-debug-f16c-fma-intel_fpga-jit-opencl-sse41-user_context*/
#pragma OPENCL FP_CONTRACT ON
inline float float_from_bits(unsigned int x) {return as_float(x);}
inline float nan_f32() { return NAN; }
inline float neg_inf_f32() { return -INFINITY; }
inline float inf_f32() { return INFINITY; }
inline bool is_nan_f32(float x) {return isnan(x); }
inline bool is_inf_f32(float x) {return isinf(x); }
inline bool is_finite_f32(float x) {return isfinite(x); }
#define sqrt_f32 sqrt 
#define sin_f32 sin 
#define cos_f32 cos 
#define exp_f32 exp 
#define log_f32 log 
#define abs_f32 fabs 
#define floor_f32 floor 
#define ceil_f32 ceil 
#define round_f32 round 
#define trunc_f32 trunc 
#define pow_f32 pow
#define asin_f32 asin 
#define acos_f32 acos 
#define tan_f32 tan 
#define atan_f32 atan 
#define atan2_f32 atan2
#define sinh_f32 sinh 
#define asinh_f32 asinh 
#define cosh_f32 cosh 
#define acosh_f32 acosh 
#define tanh_f32 tanh 
#define atanh_f32 atanh 
#define fast_inverse_f32 native_recip 
#define fast_inverse_sqrt_f32 native_rsqrt 
#define __address_space___shared __local

#define OK 8
#define OI 8
#define OJ 8
#define II 11
#define JJ 8
#define KK 8
#define JJJ 16
#define III 16
#define KKK 16


// ll suffix in OpenCL is reserved for 128-bit integers.
#if defined __OPENCL_VERSION__
#define ADD_INT64_T_SUFFIX(x) x##l
#define ADD_UINT64_T_SUFFIX(x) x##ul
// HLSL doesn't have any suffixes.
#elif defined HLSL_VERSION
#define ADD_INT64_T_SUFFIX(x) x
#define ADD_UINT64_T_SUFFIX(x) x
#else
#define ADD_INT64_T_SUFFIX(x) x##ll
#define ADD_UINT64_T_SUFFIX(x) x##ull
#endif
#pragma OPENCL EXTENSION cl_intel_channels : enable
channel float16 _loaderA_channel __attribute__((depth(256))) ;
// Address spaces for kernel_loaderA_run_on_device
#define __address_space__a __global
__kernel void kernel_loaderA_run_on_device(
 __address_space__a const float16 *restrict _a)
{
 for (int i = 0; i < OK*OI*OJ*KK*III*II; i++)
 {
 float16 _9 = _a[i];
 write_channel_intel(_loaderA_channel, _9);
 }
} // kernel kernel_loaderA_run_on_device
#undef __address_space__a
channel float16 _feederA_channel[II] __attribute__((depth(0)));
// Address spaces for kernel_feederA_lk_run_on_device
__attribute__((max_global_work_dim(0)))
__attribute__((autorun))
__kernel void kernel_feederA_lk_run_on_device(
)
{
 #define INITA (JJJ-II)
 float16 srV[II];
 int srCounter[II];
 float16 __attribute__((memory, numbanks(16), singlepump, numwriteports(1), numreadports(1))) DB[2][16];
 int counter = INITA;
 float16 v;
 while(1)
 {
     // check whether to read data
     bool wb = (counter % JJJ) >= INITA;
     int read_num = counter / JJJ;
     //printf("%d %d %d\n", counter % (JJJ*III), wb, read_num);
     if (wb && (read_num < OI*OJ*OK*KK*III)) {
         v = read_channel_intel(_loaderA_channel);
     }

    #pragma unroll
    for (int _feederA_s0_ii = 0; _feederA_s0_ii < II; _feederA_s0_ii++)
    {
        if (_feederA_s0_ii == 0) {
            srV[0] = v;
            srCounter[0] = counter;
        } else {
            srV[_feederA_s0_ii] = srV[_feederA_s0_ii-1];
            srCounter[_feederA_s0_ii] = srCounter[_feederA_s0_ii-1];
        }
        int _counter = srCounter[_feederA_s0_ii];

        int w_counter = (_counter % JJJ) - INITA;
        int read_num = (_counter) / (JJJ);
        bool idx = read_num & 1;
        bool wb = w_counter >= 0;
        int ii = w_counter%II;
        if (wb && _feederA_s0_ii == ii) {
            DB[idx][_feederA_s0_ii] = srV[_feederA_s0_ii];
        }
        bool rb = read_num > 0;
        if (rb) {
            int jjj = _counter % JJJ;
            write_channel_intel(_feederA_channel[_feederA_s0_ii], DB[!idx][_feederA_s0_ii]);
       }
    }
    counter++;
 }
} // kernel kernel_feederA_lk_run_on_device
channel float16 _loaderB_channel __attribute__((depth(256))) ;
// Address spaces for kernel_loaderB_run_on_device
#define __address_space__b __global
__kernel void kernel_loaderB_run_on_device(
 __address_space__b const float16 *restrict _b)
{
 for (int i = 0; i < OI*OJ*OK*KK*JJJ*JJ; i++)
 {
     float16 _33 = _b[i];
     write_channel_intel(_loaderB_channel, _33);
 }
} // kernel kernel_loaderB_run_on_device
#undef __address_space__b
channel float16 _feederB_channel[JJ] __attribute__((depth(0))) ;
// Address spaces for kernel_feederB_run_on_device
__attribute__((max_global_work_dim(0)))
__attribute__((autorun))
__kernel void kernel_feederB_run_on_device(
)
{
 #define INIT (JJJ*III-JJ*JJJ)
 float16 srV[JJ];
 int srCounter[JJ];
 float16 __attribute__((memory, numbanks(JJ), singlepump, numwriteports(1), numreadports(1))) DB[2][JJJ][JJ];
 int counter = INIT;
 float16 v;
 while(1)
 {
     // check whether to read data
     bool wb = (counter % (JJJ*III)) >= INIT;
     int read_num = counter / (JJJ*III);
     if (wb && (read_num < OI*OJ*OK*KK)) {
         v = read_channel_intel(_loaderB_channel);
     }

    #pragma unroll
    for (int _feederB_s0_jj = 0; _feederB_s0_jj < JJ; _feederB_s0_jj++)
    {
        if (_feederB_s0_jj == 0) {
            srV[0] = v;
            srCounter[0] = counter;
        } else {
            srV[_feederB_s0_jj] = srV[_feederB_s0_jj-1];
            srCounter[_feederB_s0_jj] = srCounter[_feederB_s0_jj-1];
        }
        int _counter = srCounter[_feederB_s0_jj];

        int w_counter = (_counter % (JJJ*III)) - INIT;
        int read_num = (_counter) / (JJJ*III);
        bool idx = read_num & 1;
        bool wb = w_counter >= 0;
        if (wb) {
            int jjj = w_counter/JJ;
            int jj = w_counter%JJ;
            if (_feederB_s0_jj == jj) DB[idx][jjj][_feederB_s0_jj] = srV[_feederB_s0_jj];
        }
        bool rb = read_num > 0;
        if (rb) {
            int jjj = _counter % JJJ;
            write_channel_intel(_feederB_channel[_feederB_s0_jj], DB[!idx][jjj][_feederB_s0_jj]);
        }
    }
    counter++;
 }
} // kernel kernel_feederB_run_on_device
channel float _c_channel[II][JJ] __attribute__((depth(256))) ;
// Address spaces for kernel_c_run_on_device
__attribute__((max_global_work_dim(0)))
__attribute__((autorun))
__kernel void kernel_c_run_on_device(
)
{
 // produce C
 float16 _C_shreg[II][JJ][257];
 // produce B
 float16 _B_shreg[II][JJ];
 // produce A
 float16 _A_shreg[II][JJ];
 int counter[II][JJ];
 #pragma unroll
 for (int _s_ii = 0; _s_ii < II; _s_ii++)
 {
     #pragma unroll
     for (int _s_jj = 0; _s_jj < JJ; _s_jj++)
     {
         counter[_s_ii][_s_jj] = 0;
     }
 }
 while(1)
      {
       #pragma unroll
       for (int _s_ii = 0; _s_ii < II; _s_ii++)
       {
        #pragma unroll
        for (int _s_jj = 0; _s_jj < JJ; _s_jj++)
        {
          #pragma unroll
          for (int _t = 0; _t < 0 + 256; _t++)
          {
           int _42 = 256 - _t;
           int _43 = 255 - _t;
           float16 _45 = _C_shreg[_s_ii][_s_jj][_43];
           _C_shreg[_s_ii][_s_jj][_42] = _45;
          } // for _t
        } // for _s_jj
       } // for _s_ii
       #pragma unroll
       for (int _firstk_s0_ii = 0; _firstk_s0_ii < II; _firstk_s0_ii++)
       {
        #pragma unroll
        for (int _firstk_s0_jj = 0; _firstk_s0_jj < JJ; _firstk_s0_jj++)
        {
          int _counter = counter[_firstk_s0_ii][_firstk_s0_jj];
          int kk = (_counter / (JJJ*III)) % KK;
          int ok = (_counter / (JJJ*III*KK)) % OK;
         bool _46 = _firstk_s0_ii == 0;
         float16 _85;
         bool _48 = _firstk_s0_jj == 0;
         if (_48)
         {
          _85 = read_channel_intel(_feederA_channel[_firstk_s0_ii]);
         } // if _48
         else
         {
          int _88 = -1 + _firstk_s0_jj;
          _85 = _A_shreg[_firstk_s0_ii][_88];
         } // if _48 else
         _A_shreg[_firstk_s0_ii][_firstk_s0_jj] = _85;
         float16 _212;
         if (_46)
         {
          float16 __213 = read_channel_intel(_feederB_channel[_firstk_s0_jj]);
          _212 = __213;
         } // if _46
         else
         {
          int _214 = _firstk_s0_ii + -1;
          _212 = _B_shreg[_214][_firstk_s0_jj];
         } // if _46 else
         float16 _248 = _212;
         _B_shreg[_firstk_s0_ii][_firstk_s0_jj] = _248;
         #pragma unroll
         for (int _firstk_s0_kkk = 0; _firstk_s0_kkk < 0 + 16; _firstk_s0_kkk++)
         {
          float _266;
          if (kk == 0 && ok == 0 && _firstk_s0_kkk == 0)
          {
           float _270 = float_from_bits(0 /* 0 */);
           _266 = _270;
          } // if _269
          else
          {
           float _271;
           bool _272 = _firstk_s0_kkk == 0;
           if (_272)
           {
            int _273 = _firstk_s0_kkk + 15;
            float16 x = _C_shreg[_firstk_s0_ii][_firstk_s0_jj][256];
            float _275 = x[_273];
            _271 = _275;
           } // if _272
           else
           {
            int _276 = _firstk_s0_kkk + -1;
            float16 x = _C_shreg[_firstk_s0_ii][_firstk_s0_jj][0];
            float _278 = x[_276];
            _271 = _278;
           } // if _272 else
           float _279 = _271;
           _266 = _279;
          } // if _269 else
          float _280 = _266;
          float _282 = _A_shreg[_firstk_s0_ii][_firstk_s0_jj][_firstk_s0_kkk];
          float _284 = _B_shreg[_firstk_s0_ii][_firstk_s0_jj][_firstk_s0_kkk];
          float _285 = _282 * _284;
          float _286 = _280 + _285;
          _C_shreg[_firstk_s0_ii][_firstk_s0_jj][0][_firstk_s0_kkk] = _286;
          (void)_286;
         } // for _firstk_s0_kkk
         if ((kk == KK-1) && (ok == OK-1))
         {
          float16 x = _C_shreg[_firstk_s0_ii][_firstk_s0_jj][0];
          float _291 = x[15];
          write_channel_intel(_c_channel[_firstk_s0_ii][_firstk_s0_jj], _291);
          (void)_291;
         } // if _289
         counter[_firstk_s0_ii][_firstk_s0_jj]++;
        } // for _firstk_s0_jj
       } // for _firstk_s0_ii
      } // for _firstk_s0_jjj_t
} // kernel kernel_c_run_on_device
channel float _drainer_channel[8] __attribute__((depth(256))) ;
// Address spaces for kernel_drainer_gather_c_run_on_device
__attribute__((max_global_work_dim(0)))
__attribute__((autorun))
__kernel void kernel_drainer_gather_c_run_on_device(
)
{
 float _drainer_gather_c_shreg[JJ][II];
 while(1)
    {
     for (int _drainer_s0_ii_gather = 0; _drainer_s0_ii_gather < II; _drainer_s0_ii_gather++)
     {
      #pragma unroll
      for (int _drainer_s0_ii = 0; _drainer_s0_ii < II; _drainer_s0_ii++)
      {
       #pragma unroll
       for (int _drainer_s0_jj = 0; _drainer_s0_jj < JJ; _drainer_s0_jj++)
       {
           bool _294 = 0 < _drainer_s0_ii;
           bool _295 = _drainer_s0_ii_gather == _drainer_s0_ii;
           bool _296 = _drainer_s0_ii == II-1;
        if (_295)
        {
         float __297 = read_channel_intel(_c_channel[_drainer_s0_ii][_drainer_s0_jj]);
         _drainer_gather_c_shreg[_drainer_s0_jj][_drainer_s0_ii] = __297;
         (void)__297;
        } // if _295
        else
        {
         if (_294)
         {
          int _298 = _drainer_s0_ii + -1;
          float _300 = _drainer_gather_c_shreg[_drainer_s0_jj][_298];
          _drainer_gather_c_shreg[_drainer_s0_jj][_drainer_s0_ii] = _300;
          (void)_300;
         } // if _294
        } // if _295 else
        if (_296)
        {
         float _302 = _drainer_gather_c_shreg[_drainer_s0_jj][II-1];
         write_channel_intel(_drainer_channel[_drainer_s0_jj], _302);
         (void)_302;
        } // if _296
       } // for _drainer_s0_jj
      } // for _drainer_s0_ii
     } // for _drainer_s0_ii_gather
    } // for _drainer_s0_jjj_t
} // kernel kernel_drainer_gather_c_run_on_device
channel float8 _collector_channel __attribute__((depth(256))) ;
// Address spaces for kernel_collector_gather_drainer_run_on_device
__attribute__((max_global_work_dim(0)))
__attribute__((autorun))
__kernel void kernel_collector_gather_drainer_run_on_device(
)
{
 float8 _collector_gather_drainer_shreg;
 while(1)
     {
      #pragma unroll
      for (int _collector_s0_gather_jj = 0; _collector_s0_gather_jj <JJ; _collector_s0_gather_jj++)
      {
       float __303 = read_channel_intel(_drainer_channel[_collector_s0_gather_jj]);
       _collector_gather_drainer_shreg[_collector_s0_gather_jj] = __303;
       (void)__303;
      } // for _collector_s0_gather_jj
      write_channel_intel(_collector_channel, _collector_gather_drainer_shreg);
     } // for _collector_s0_ii
} // kernel kernel_collector_gather_drainer_run_on_device
// Address spaces for kernel_unloader_run_on_device
#define __address_space__unloader __global
__kernel void kernel_unloader_run_on_device(
 __address_space__unloader float8 *restrict _unloader)
{
 for (int i = 0; i < OI*II*III*OJ*JJJ; i++)
 {
     float8 __329 = read_channel_intel(_collector_channel);
     _unloader[i] = __329;
 }
} // kernel kernel_unloader_run_on_device
#undef __address_space__unloader

