# RPFS Reproducability
The models which were used to benchmark RPFS can be found at the repository [pnmcc-models-2022](https://github.com/yanntm/pnmcc-models-2022).

The data file which all tables and plots are based on is found here: `latex/data_nonreduced.csv`.
The binary used for the benchmark is found here: `reproduce/bin/verifypn-linux64.bin`, and all code for it can be found at [theodor349/P7-verifypn](https://github.com/theodor349/P7-verifypn/tree/RPFS).

Note: The results from Table 2 cannot be generated or reproduced by this package. As this would require access the [DEIS](https://github.com/DEIS-Tools/DEIS-MCC) cluster at AAU.  

## Reproduce all tables and plots
### Requirements
 - Git LFS
 - .NET 6 Runtime + SDK

### Guide
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    git lfs pull
    cd latex
    ./compile-plots-tables.sh 

## Reproducing all results
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
