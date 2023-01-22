#!/bin/bash

TIME_LIMIT=300 
NUM_PROBLEMS=1350

STRATEGIES=(
    "RDFS --seed-offset 5760351"
    "BestFS"
    "DFS"
    "BFS"
    "IPFS"
    "DPFS"
    "RPFS --seed-offset 4526035"
)

cd "$(dirname "$0")"
BINARY="./bin/verifypn-linux64"
MODELS_PATH="./MCC2022" 
OUTPUT_PATH="./results"

start_jobs() {
    STRAT_LEN=${#STRATEGIES[@]}
    serialize_array STRATEGIES STRAT_STR "|"

    TOTAL_TIME_LIMIT=$(echo "($TIME_LIMIT * $STRAT_LEN * 16) / 60 + 1" | bc)

    for MODEL in $(ls "$MODELS_PATH" | head -n "$NUM_PROBLEMS"); do
	# sbatch --time "$TOTAL_TIME_LIMIT" "./run-model.sh" "$BINARY" "$TIME_LIMIT" "$STRAT_STR" "$MODELS_PATH/$MODEL" "$OUTPUT_PATH/$MODEL.csv"
	timeout "${TOTAL_TIME_LIMIT}m" "./run-model.sh" "$BINARY" "$TIME_LIMIT" "$STRAT_STR" "$MODELS_PATH/$MODEL" "$OUTPUT_PATH/$MODEL.csv"
    done
}

serialize_array() {
    declare -n _array="${1}" _str="${2}" # _array, _str => local reference vars
    local IFS="${3:-$'\x01'}"
    # shellcheck disable=SC2034 # Reference vars assumed used by caller
    _str="${_array[*]}" # * => join on IFS
}

start_jobs
