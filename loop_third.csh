#!/bin/csh

foreach s (1 2 4 5 8 16)
    g++ -DNMB=$s -o third third.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
    ./third
end