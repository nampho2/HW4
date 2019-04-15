# Markov Decision Processes

Assignment by npho3, the code was borrowed and further improved on from [@cmaron](https://github.com/cmaron/CS-7641-assignments) and [@mmallo3](https://github.gatech.edu/mmallo3/CS7641_Project4).

## Output
Output CSVs and images are written to `./output` and `./output/images` respectively. Sub-folders will be created for
each RL algorithm (PI, VI, and Q) as well as one for the final report data.

If these folders do not exist the experiments module will attempt to create them.

Graphing:
---------

The run_experiment script can be use to generate plots via:

```
python3 run_experiment.py --plot --all --threads 4 --verbose
```

Note: I used the `requirements.txt` file to use pip to install all the required Python libraries and their respective versions.

Since the files output from the experiments follow a common naming scheme this will determine the problem, algorithm,
and parameters as needed and write the output to sub-folders in `./output/images` and `./output/report`.

I also deviated from @cmaron and @mmallo3 by using my own `plot.R` script for custom figures from the run outputs.
