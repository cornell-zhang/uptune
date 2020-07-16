#include <assert.h> 
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <cuda_profiler_api.h>
// #include <cutil_inline.h>

// Convenience function for checking CUDA runtime API results
// can be wrapped around any runtime API call. No-op in release builds.
inline
cudaError_t checkCuda(cudaError_t result)
{
#if defined(DEBUG) || defined(_DEBUG)
  if (result != cudaSuccess) {
    fprintf(stderr, "CUDA Runtime Error: %s\n", cudaGetErrorString(result));
    assert(result == cudaSuccess);
  }
#endif
  return result;
}

 
 #define MAX_THREADS    128 

 int*   r_values;
 int*   d_values;

 // initialize data set
 void Init(int* values, int i, int N) {
    srand( time(NULL) );
        printf("\n------------------------------\n");

        if (i == 0) {
        // Uniform distribution
                printf("Data set distribution: Uniform\n");
                for (int x = 0; x < N; ++x) {
                        values[x] = rand() % 100;
                        //printf("%d ", values[x]);
                }
        }
        else if (i == 1) {
        // Gaussian distribution
        #define MEAN    100
        #define STD_DEV 5
                printf("Data set distribution: Gaussian\n");
                float r;
                for (int x = 0; x < N; ++x) {
                        r  = (rand()%3 - 1) + (rand()%3 - 1) + (rand()%3 - 1);
                        values[x] = int( round(r * STD_DEV + MEAN) );
                        //printf("%d ", values[x]);
                }
        }
        else if (i == 2) {
        // Bucket distribution
                printf("Data set distribution: Bucket\n");
                int j = 0;
                for (int x = 0; x < N; ++x, ++j) {
                        if (j / 20 < 1)
                                values[x] = rand() % 20;
                        else if (j / 20 < 2)
                                values[x] = rand() % 20 + 20;
                        else if (j / 20 < 3)
                                values[x] = rand() % 20 + 40;
                        else if (j / 20 < 4)
                                values[x] = rand() % 20 + 60;
                        else if (j / 20 < 5)
                                values[x] = rand() % 20 + 80;
                        if (j == 100)
                                j = 0;
                        //printf("%d ", values[x]);
                }
        }
        else if (i == 3) {
        // Sorted distribution
                printf("Data set distribution: Sorted\n");
                /*for (int x = 0; x < N; ++x)
                        printf("%d ", values[x]);
        */
        }
    else if (i == 4) {
        // Zero distribution
                printf("Data set distribution: Zero\n");
                int r = rand() % 100;
                for (int x = 0; x < N; ++x) {
                        values[x] = r;
                        //printf("%d ", values[x]);
                }
        }
        printf("\n");
}

 // Kernel function
 __global__ static void quicksort(int* values, int N) {
 #define MAX_LEVELS 300

    int pivot, L, R;
    int idx =  threadIdx.x + blockIdx.x * blockDim.x;
    int start[MAX_LEVELS];
    int end[MAX_LEVELS];

    start[idx] = idx;
    end[idx] = N - 1;
    while (idx >= 0) {
        L = start[idx];
        R = end[idx];
        if (L < R) {
            pivot = values[L];
            while (L < R) {
                while (values[R] >= pivot && L < R)
                    R--;
                if(L < R)
                    values[L++] = values[R];
                while (values[L] < pivot && L < R)
                    L++;
                if (L < R)
                    values[R--] = values[L];
            }
            values[L] = pivot;
            start[idx + 1] = L + 1;
            end[idx + 1] = end[idx];
            end[idx++] = L;
            if (end[idx] - start[idx] > end[idx - 1] - start[idx - 1]) {
                            // swap start[idx] and start[idx-1]
                            int tmp = start[idx];
                            start[idx] = start[idx - 1];
                            start[idx - 1] = tmp;

                            // swap end[idx] and end[idx-1]
                            tmp = end[idx];
                            end[idx] = end[idx - 1];
                            end[idx - 1] = tmp;
                    }

        }
        else
            idx--;
    }
}
 
 // program main
 int main(int argc, char **argv) {

    if (argc != 3 ) {
        fprintf(stderr, "Syntax: %s <Vector size Width>  <CacheConfL1> \n", argv[0]);
            return EXIT_FAILURE;
    }
    
    int N = atoi(argv[1]);
    int CacheConfL1 = atoi(argv[2]);
    size_t size = N * sizeof(long int);
    
    printf("./bitonic_sort starting with %d numbers...\n", N);
    srand( time(NULL) );

    int devId = 0;
    checkCuda( cudaSetDevice(devId) );
        cudaDeviceReset();
    
    cudaDeviceProp prop;
    checkCuda( cudaGetDeviceProperties(&prop, devId) );
    printf("Device: %s\n", prop.name);

    
    // allocate host memory
    r_values = (int*)malloc(size);
    
    // allocate device memory
        cudaMalloc((void**)&d_values, size);

    // allocate threads per block
        const unsigned int cThreadsPerBlock = 128;
                
    /* Types of data sets to be sorted:
         *      1. Normal distribution
         *      2. Gaussian distribution
         *      3. Bucket distribution
         *      4. Sorted Distribution
         *      5. Zero Distribution
         */

    for (int i = 0; i < 1; ++i) {
                // initialize data set
                Init(r_values, i, N);

        // copy data to device  
        cudaMemcpy(d_values, r_values, size, cudaMemcpyHostToDevice) ;

        printf("Beginning kernel execution...\n");

        if (CacheConfL1 == 1){
            cudaFuncSetCacheConfig(quicksort, cudaFuncCachePreferShared);
        }
        else if (CacheConfL1 == 2){
            cudaFuncSetCacheConfig(quicksort, cudaFuncCachePreferEqual);
        }
        else if (CacheConfL1 == 3){
            cudaFuncSetCacheConfig(quicksort, cudaFuncCachePreferL1);
        }
        else {
            cudaFuncSetCacheConfig(quicksort, cudaFuncCachePreferNone);
        }
        
         cudaThreadSynchronize() ;  
    
        // execute kernel
        cudaProfilerStart(); 
        quicksort <<< MAX_THREADS / cThreadsPerBlock, MAX_THREADS / cThreadsPerBlock, cThreadsPerBlock >>> (d_values, N);
        cudaProfilerStop();   

        cudaThreadSynchronize() ;
            
        // copy data back to host
        cudaMemcpy(r_values, d_values, size, cudaMemcpyDeviceToHost) ;
    
        // test
        printf("Assertion started\n");
        for (int x = 0; x < N - 1; x++) 
            assert(r_values[x] <= r_values[x + 1]);
        printf("Assertion Finished");
    }
    
    // free memory
    cudaFree(d_values);
    free(r_values);
    
    //cutilExit(argc, argv);
    cudaThreadExit();
}
