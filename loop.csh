#!/bin/csh

foreach s (1 2 4 5 8 16)
    foreach b (1 4 16 32 64 128 256 512)
        g++ -DNMB=$s -DLOCAL_SIZE=$b -o first first.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
        ./first
        end
end