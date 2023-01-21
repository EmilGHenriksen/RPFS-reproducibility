# RPFS Reproducability
The models which were used to benchmark RPFS can be found at [MCC's website](https://mcc.lip6.fr/2022/models.php).

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
 - GNU time(1)
 - .NET 6 runtime

### Guide 
    git clone https://github.com/theodor349/RPFS-reproducibility
    cd RPFS-reproducability
    cd reproduce
    tar xf MCC2022.tar.gz       # Extract the MCC models
    ./start.sh                  # Generate all data (all models, all strategies)
    ./archiver.sh               # Combine all data into a single `data.csv` file
    cd ..
    mv reproduce/results/data.csv latex/data_nonreduced.csv
    cd latex
    ./compile-plots-tables.sh
