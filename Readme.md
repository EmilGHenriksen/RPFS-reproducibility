# RPFS Reproducability
The models which were used to benchmark RPFS can be found at [mcc](https://mcc.lip6.fr/2022/models.php)'s website.
All data used to compile all plots and tables can be found under the folder `Latex Files` along with the binary used generate these results.

In this folder there are:
 - `data_nonreduced.csv`
   - Contains all execution results from redeuced models and queries 
 - `data_reduced.csv`
   - Contains all execution results from non-redeuced models and queries
 - `TruthLookup.csv`
   - Contains the correct solution to most instances 
   - Was gained by running the original Tapaal search strategies on all models and queries 
 - `rpfs`
   - The binary used to generate our results
 

All plots and tabels can be compiled by running the `Latex Files/compile_plots_tabels.sh` script.
