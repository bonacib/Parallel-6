#!/bin/bash
#SBATCH -J bonaciproj6.3
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o bonaciproj6.3.out
#SBATCH -e bonaciproj6.3.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bonacib@oregonstate.edu

for t in 1 2 4 5 8 16
do
        for b in 1 4 16 32 64 128 256 512
        do
                /usr/local/apps/cuda/cuda-10.1/bin/nvcc -DNMB=$s -DLOCAL_SIZE=$b -o first first.cpp
                ./first
        done
done