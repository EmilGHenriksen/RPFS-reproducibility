# RPFS Reproducability
The models which were used to benchmark RPFS can be found at [MCC's website](https://mcc.lip6.fr/2022/models.php).

The data file which all tables and plots are based on is found here: `latex/data_nonreduced.csv`.
The binary used for the benchmark is found here: `reproduce/bin/verifypn-linux64.bin`, and all code for it can be found at this [repository](https://github.com/theodor349/P7-verifypn/tree/RPFS).

## Reproduce all tables and plots
### Requirements
 - .NET 6 Runtime

### Guide
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    cd latex
    ./compile-plots-tables.sh 

## Reproducing all results
### Requirements 
 - OS: Linux
 - Git LFS
 - GNU time(1)
 - .NET 6 runtime

### Guide 
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    git lfs pull
    cd reproduce
    tar xf MCC2022.tar.gz       # Extract the MCC models
    ./start.sh                  # Generate all data (all models, all strategies)
    ./archiver.sh               # Combine all data into a single `data.csv` file
    cd ..
    mv reproduce/results/data.csv latex/data_nonreduced.csv
    cd latex
    ./compile-plots-tables.sh
