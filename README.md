# RPFS Reproducability
The models which were used to benchmark RPFS can be found at [yanntm/pnmcc-models-2022](https://github.com/yanntm/pnmcc-models-2022).

The data file which all tables and plots are based on is found here: `latex/data_nonreduced.csv`.
The binary used for the benchmark is found here: `reproduce/bin/verifypn-linux64.bin`, and all code for it can be found at [theodor349/P7-verifypn](https://github.com/theodor349/P7-verifypn/tree/RPFS).

## Guides
1. [Generate table 1, figures 3 + 4](#generate-table-1-figures-3--4)
2. [Generate table 1, figures 3 + 4 (from scratch)](#generate-table-1-figures-3--4-from-scratch)
3. [Generate table 2 (from scratch)](#generate-table-2-from-scratch)

## Generate table 1, figures 3 + 4
Follow the guide to produce table 1 and figures 3 + 4, using the precomputed results.

### Requirements
 - Git LFS
 - .NET 6 Runtime + SDK

### Guide
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    git lfs pull
    cd latex
    ./compile-plots-tables.sh 

## Generate table 1, figures 3 + 4 (from scratch)
Note: this will take a *long* time to run.

### Requirements 
 - OS: Linux
 - Git LFS
 - GNU time(1)
 - .NET 6 runtime + SDK

### Guide 
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    git lfs pull
    cd reproduce
    mkdir results
    tar xf MCC2022.tar.gz       # Extract the MCC models
    ./start.sh                  # Generate all data (all models, all strategies)
    ./archiver.sh               # Combine all data into a single `data.csv` file
    cd ..
    mv reproduce/results/data.csv latex/data_nonreduced.csv
    cd latex
    ./compile-plots-tables.sh

## Generate table 2 (from scratch)
Note: this will take a *long* time to run.

### Requirements 
 - OS: Linux
 - Git LFS
 - GNU time(1)
 - .NET 6 runtime + SDK

### Guide 
    not yet written
