# RPFS Reproducability
The models which were used to benchmark RPFS can be found at [mcc](https://mcc.lip6.fr/2022/models.php)'s website.
All data used to compile all plots and tables can be found under the directory `Latex Files` along with the binary used generate these results.

In this directory there are:
 - `data_nonreduced.csv`
   - Contains all execution results from redeuced models and queries 
 - `data_reduced.csv`
   - Contains all execution results from non-redeuced models and queries
 - `TruthLookup.csv`
   - Contains the correct solution to most instances 
   - Was gained by running the original Tapaal search strategies on all models and queries 
 - `rpfs`
   - The binary used to generate our results
   - Running the binary is done as follows: `$BINARY -n -x $QUERY -s $STRAT $MODEL_PATH/model.pnml $MODEL_PATH/ReachabilityCardinality.xml` 
     - Where `$STRAT` can be either 
       - `RDFS`, `BestFS`, `DFS`, `BFS`, `PFS`, `DPFS`, `RPFS`

All plots and tabels can be compiled by running the `Latex Files/compile_plots_tabels.sh` script.

## Reproducing all results
 1. Download all models into a directory `$model_dir` 
 2. Run `./reproduce/start rpfs $model_dir reproduce/results`
 3. All results will then bee added to `reproduce/results` 
 4. Then run `./reproduce/archiver reproduce/results`
   - This will aggregate all the results into a single csv file name `reproduce/results/data.csv`  
