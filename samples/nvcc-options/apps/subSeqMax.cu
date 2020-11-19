#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <cuda_profiler_api.h>

//#define N 1573700//1310720//262144//131072//262144//83886080

//Quantidade de threads por blocos
#define BLOCK_SIZE 32//1//1024//95536
#define nThreadsPerBlock 128//420//128//420 ou 416

#define NFinal (nThreadsPerBlock * 5)

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


__device__ int* memoria(int *vetDados, int ElemPorBlocos, int qtdProces){

    __shared__ int vetComp[4096];
    
    int auxGrupoDe32 = (qtdProces * 32);

    int comecoBloco = blockIdx.x * ElemPorBlocos; // onde cada bloco irá comeca
    int qtdElemThread = ElemPorBlocos / blockDim.x;

    int idCompartilhada = threadIdx.x;
    
    int idGlobal = comecoBloco + ((threadIdx.x / 32) * qtdElemThread) + (threadIdx.x - ((threadIdx.x / 32) * 32)) + auxGrupoDe32;

    int i;
    for(i = 0; i < 4096; i += blockDim.x){
        vetComp[idCompartilhada] = vetDados[idGlobal];
        idCompartilhada += blockDim.x;
        idGlobal += (qtdElemThread * 4);
    }
    
    return vetComp;
}

__global__ void subSeqMax(int *vet, int *vetFinal, int ElemPorThread, int n){   
    
    __shared__ int *p; // ponteiro para apontar para o vetor compartilhado
    
    //      M         t_m       S      suf
    int ini_M, fim_M, t_M, ini_S, fim_S, suf; //Variaveis do algoritmo
    t_M = suf = 0;

    int comecoThread = (threadIdx.x * 32);

    int j;
    for(j = 0; j < (n / 4096); j++){ // Quantas vezes terei que processa até chegar no n/blocos sendo que o vet compartilhado é de 4096

        p = memoria(vet,n,j);

        __syncthreads();

            if(threadIdx.x < 128){

                ini_M = fim_M = ini_S = fim_S = comecoThread -1;

                int i;
                for(i = comecoThread -1; i < comecoThread + 32; i++){
                    if(i == fim_M){
                        fim_S++;
                        suf += p[i+1];

                        if(suf < 0){
                            suf = 0;
                            fim_S = -1;
                         }
                    
                        ini_S = fim_S == 0 ? 0 : ini_S; // Inicio S

                         if(p[i+1] > 0){
                           fim_M++;
                           t_M += p[i+1];
                           ini_M = fim_M == 0 ? 0 : ini_M; // Inicio M
                         }
                    }
                    else{
                         if(suf + p[i+1] > t_M){
                             fim_S++;
                             if(ini_M == -1){
                              fim_S = ini_S = i +1;
                             }

                             suf += p[i+1];
                             ini_M = ini_S;
                             fim_M = fim_S;
                             t_M = suf;
                         }
                         else{
                                if(suf + p[i+1] > 0){
                                    fim_S++;
                                    if(suf == 0){
                                        ini_S = fim_S = i+1;
                                    }

                                    suf += p[i+1];
                                }
                                else{
                                    ini_S = fim_S = i + 2;
                                    suf = 0;
                                }
                        }//else
                }//else
            }// 1* for
        }// If 128  
    }// 2* for

    if(threadIdx.x < 128){
        int idThread = blockIdx.x * blockDim.x + threadIdx.x;

        vetFinal[(idThread * 5)] =  vetFinal[(idThread * 5)+1] = vetFinal[(idThread * 5)+2] = vetFinal[(idThread * 5)+3] =
        vetFinal[(idThread * 5)+4] = -1;

        //Colocando o M
        vetFinal[(idThread * 5)+2] = t_M;

        //Calculando o Prefixo
        int pref_Max, soma_Pref;
        soma_Pref  = 0;
        pref_Max = 0;

        int i;
        if(ini_M > comecoThread -1){
            for(i = 0; i < ini_M; i++){
                soma_Pref += p[i];

                if(soma_Pref > pref_Max){
                    pref_Max = soma_Pref;
                }
            }

            if(pref_Max == 0){
                vetFinal[(idThread * 5)] = 0;
                vetFinal[(idThread * 5)+1] = soma_Pref;
            }
            else{
                vetFinal[(idThread * 5)] = pref_Max; //Prefixo
                vetFinal[(idThread * 5)+1] = soma_Pref - pref_Max; //Numeros negativos
            }
        }

        //Calculo do sufixo
        int suf_Max, soma_Suf;
        soma_Suf = suf_Max = 0;

        if(fim_M < comecoThread + 32){
            for(i = (comecoThread + 32)-1; i > fim_M; i--){
                soma_Suf += p[i];

                if(soma_Suf > suf_Max){
                    suf_Max = soma_Suf;
                }
            }

            if(suf_Max == 0){
                vetFinal[(idThread * 5)+3] = 0; //Sufixo vazio
                vetFinal[(idThread * 5)+4] = suf_Max;//Os Numeros negativos

            }
            else{
                vetFinal[(idThread * 5)+3] = suf_Max;   //Sufixo vazio
                vetFinal[(idThread * 5)+4] = soma_Suf - suf_Max;//Os Numeros negativos
            }
        }
    }//if 128
}

void subSeqMaxFinal(int *vet, int n){

    //      M         t_m       S      suf
    int ini_M, fim_M, t_M, ini_S, fim_S, suf;
    ini_M = fim_M = ini_S = fim_S = -1;

    t_M = suf = 0;

    int i;
    for(i = -1; i < n-1; i++){
        if(i == fim_M){
            fim_S++;
            suf += vet[i+1];

            if(suf < 0){
                suf = 0;
                fim_S = -1;
            }

            ini_S = fim_S == 0 ? 0 : ini_S; // Inicio S

              if(vet[i+1] > 0){
                   fim_M++;
                   t_M += vet[i+1];
                   ini_M = fim_M == 0 ? 0 : ini_M; // Inicio M
               }
        }
        else{
             if(suf + vet[i+1] > t_M){
                 fim_S++;
                 if(ini_M == -1){
                  fim_S = ini_S = i +1;
                 }

                 suf += vet[i+1];
                 ini_M = ini_S;
                 fim_M = fim_S;
                 t_M = suf;

             }
             else{
                    if(suf + vet[i+1] > 0){
                        fim_S++;
                        if(suf == 0){
                            ini_S = fim_S = i+1;
                        }


                    }
                    else{
                        ini_S = fim_S = i + 2;
                        suf = 0;
                    }
             }
        }
    }
    printf("Assertion started\n");
    assert (t_M == 964);
    printf("Assertion Finished");

    printf(" \n\n A sub Sequencia deu %d  \n\n", t_M);
}

int main(int argc, char** argv){

    float elapsedTime;    // Tempo
    cudaEvent_t start, stop; // Tempo

    //Vetor aux
    int *vet_d; int *vetFinal_d;
    
    if (argc != 3) {
        fprintf(stderr, "Syntax: %s <Vector size Width> <CacheConfL1> \n", argv[0]);
            return EXIT_FAILURE;
    }

    //Vet
    int N = atoi(argv[1]);
    int *vet_h = (int *) malloc(sizeof(int) * N); // Vetor Dados
    int *vetFinal_h = (int *) malloc(sizeof(int) * NFinal);// Vetor Final

    int i;
    for(i = 0; i < N; i++){ // Preenchimento dos dados
         vet_h[i] = -1;
    }

    for(i = 0; i < NFinal; i++){ // Preenchimento dos dados
         vetFinal_h[i] = -1;
    }

    vet_h[131] = 954;
    vet_h[132] = 10;
    
    int devId = 0;
    int CacheConfL1 = atoi(argv[2]);

    checkCuda( cudaSetDevice(devId) );
        cudaDeviceReset();

    cudaDeviceProp prop;
    checkCuda( cudaGetDeviceProperties(&prop, devId) );
    printf("Device: %s\n", prop.name);

    //Reservando o espaço na memoria no device
    cudaMalloc((void**)&vet_d, N * sizeof(int)); //Vetor de dados
    cudaMalloc((void**)&vetFinal_d, NFinal * sizeof(int));// Vetor Final

    //Copiando o vetor de dados para o device
        cudaMemcpy(vet_d, vet_h, N * sizeof(int), cudaMemcpyHostToDevice);

    int ElemPorBlocos = (N / BLOCK_SIZE);
    int ElemPorThread = (ElemPorBlocos / nThreadsPerBlock);

    if (CacheConfL1 == 1){
    cudaFuncSetCacheConfig(subSeqMax, cudaFuncCachePreferShared);
    }
    else if (CacheConfL1 == 2){
    cudaFuncSetCacheConfig(subSeqMax, cudaFuncCachePreferEqual);
    }
    else if (CacheConfL1 == 3){
    cudaFuncSetCacheConfig(subSeqMax, cudaFuncCachePreferL1);
    }
    else {
    cudaFuncSetCacheConfig(subSeqMax, cudaFuncCachePreferNone);
    }
 
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, 0);
    
    cudaProfilerStart(); 
    subSeqMax<<<BLOCK_SIZE, nThreadsPerBlock>>>(vet_d, vetFinal_d, ElemPorThread,N / BLOCK_SIZE);
    cudaProfilerStop();

    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    cudaEventElapsedTime(&elapsedTime, start, stop);
    printf("Primeiro kernel (ms) = %f\n\n", elapsedTime);
    cudaMemcpy(vetFinal_h, vetFinal_d, NFinal * sizeof(int), cudaMemcpyDeviceToHost); //Resposta Final

    /*for(i = 0; i < 4096; i++){
        if(vetFinal_h[i] != 0 && vetFinal_h[i] != -1 )
            printf("%d ", vetFinal_h[i]);   
    }*/
        
    printf("\n\n");

    cudaFree(vetFinal_d);
    cudaFree(vet_d);

        subSeqMaxFinal(vetFinal_h, NFinal);

    return 0;
}
