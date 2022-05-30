#!/bin/csh

foreach s (1 2 4 5 8 16)
    foreach b (32 64 128 256)
        g++ -DNMB=$s -DLOCAL_SIZE=$b  -o third third.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
        ./third
    end
end