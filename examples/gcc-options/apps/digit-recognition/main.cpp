/*===============================================================*/
/*                                                               */
/*                    digit_recognition.cpp                      */
/*                                                               */
/*   Main host function for the Digit Recognition application.   */
/*                                                               */
/*===============================================================*/

// standard C/C++ headers
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <string>
#include <time.h>
#include <sys/time.h>
#include <fstream>
#include <iostream>

// dataset information
#define NUM_TRAINING 18000
#define CLASS_SIZE 1800
#define NUM_TEST 2000
#define DIGIT_WIDTH 4

// typedefs
typedef unsigned long long DigitType;
typedef unsigned char      LabelType;

// parameters
#define K_CONST 3
#define PAR_FACTOR 40
// data
#include "training_data.h"
#include "testing_data.h"

// types and constants used in the functions below
const unsigned long long m1  = 0x5555555555555555; //binary: 0101...
const unsigned long long m2  = 0x3333333333333333; //binary: 00110011..
const unsigned long long m4  = 0x0f0f0f0f0f0f0f0f; //binary:  4 zeros,  4 ones ...

// popcount function
// source: wikipedia (https://en.wikipedia.org/wiki/Hamming_weight)
int popcount(DigitType x)
{
   x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
   x = (x & m2) + ((x >> 2) & m2); //put count of each 4 bits into those 4 bits 
   x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits 
   x += x >>  8;  //put count of each 16 bits into their lowest 8 bits
   x += x >> 16;  //put count of each 32 bits into their lowest 8 bits
   x += x >> 32;  //put count of each 64 bits into their lowest 8 bits
   return x & 0x7f;
}

void update_knn( const DigitType* train_inst, const DigitType* test_inst, int dists[K_CONST], int labels[K_CONST], int label ) 
{
  int dist = 0;

  for (int i = 0; i < DIGIT_WIDTH; i ++ )
  {
    DigitType diff = test_inst[i] ^ train_inst[i];
    dist += popcount(diff);
  }

  int max_dist = 0;
  int max_dist_id = K_CONST+1;

  // Find the max distance
  FIND_MAX_DIST: for ( int k = 0; k < K_CONST; ++k ) 
  {
    if ( dists[k] > max_dist ) 
    {
      max_dist = dists[k];
      max_dist_id = k;
    }
  }

  // Replace the entry with the max distance
  if ( dist < max_dist )
  {
    dists[max_dist_id] = dist;
    labels[max_dist_id] = label;
  }

  return;
}

LabelType knn_vote(int labels[K_CONST]) 
{
  int max_vote = 0;
  LabelType max_label = 0;
  
  int votes[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  for (int i = 0; i < K_CONST; i ++ )
    votes[labels[i]] ++;

  for (int i = 0; i < 10; i ++ ) 
  {
    if (votes[i] > max_vote)
    {
      max_vote = votes[i];
      max_label = i;
    }
  }

  return max_label;

}

// sw top function
void DigitRec_sw(const DigitType training_set[NUM_TRAINING * DIGIT_WIDTH], 
                 const DigitType test_set[NUM_TEST * DIGIT_WIDTH], 
                 LabelType results[NUM_TEST]) 
{

  // nearest neighbor set
  int dists[K_CONST];
  int labels[K_CONST];

  // loop through test set
  TEST_LOOP: for (int t = 0; t < NUM_TEST; ++t) 
  {
    // Initialize the neighbor set
    SET_KNN_SET: for ( int i = 0; i < K_CONST; ++i ) 
    {
      // Note that the max distance is 256
      dists[i] = 256;
      labels[i] = 0;
    }

    // for each training instance, compare it with the test instance, and update the nearest neighbor set
    TRAINING_LOOP : for ( int i = 0; i < NUM_TRAINING; ++i ) 
      update_knn(&training_set[i * DIGIT_WIDTH], &test_set[t * DIGIT_WIDTH], dists, labels, i / CLASS_SIZE);
      
    // Compute the final output
    LabelType max_vote = knn_vote(labels);
    results[t] = max_vote;

  }

}

void check_results(LabelType* result, const LabelType* expected, int cnt)
{
  int correct_cnt = 0;

  std::ofstream ofile;
  ofile.open("outputs.txt");
  if (ofile.is_open())
  {
    for (int i = 0; i < cnt; i ++ )
    {
      if (result[i] != expected[i])
        ofile << "Test " << i << ": expected = " << int(expected[i]) << ", result = " << int(result[i]) << std::endl;
      else
        correct_cnt ++;
    }

    ofile << "\n\t " << correct_cnt << " / " << cnt << " correct!" << std::endl;
    ofile.close();
  }
  else
  {
    std::cout << "Failed to create output file!" << std::endl;
  }
      

}

int main(int argc, char ** argv) 
{
  printf("Digit Recognition Application\n");

  // for this benchmark, data is already included in arrays:
  //   training_data: contains 18000 training samples, with 1800 samples for each digit class
  //   testing_data:  contains 2000 test samples
  //   expected:      contains labels for the test samples

  // timers
  struct timeval start, end;

  // create space for the result
  LabelType* result = new LabelType[NUM_TEST];

  // software version
  gettimeofday(&start, NULL);
  DigitRec_sw(training_data, testing_data, result);
  gettimeofday(&end, NULL);

  // check results
  printf("Checking results:\n");
  check_results( result, expected, NUM_TEST );
    
  // print time
  long long elapsed = (end.tv_sec - start.tv_sec) * 1000000LL + end.tv_usec - start.tv_usec;   
  printf("elapsed time: %lld us\n", elapsed);

  delete []result;

  return EXIT_SUCCESS;

}
