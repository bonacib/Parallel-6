#!/bin/bash
#SBATCH -J bonaciproj6.1
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o bonaciproj6.1.out
#SBATCH -e bonaciproj6.1.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bonacib@oregonstate.edu

for t in 1 2 4 5 8 16
do
        for b in 1 4 16 32 64 128 256 512
        do
                g++ -o printinfo printinfo.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
                ./printinfo
        done
done