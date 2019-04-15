# Markov Decision Processes

Assignment by npho3, the code was borrowed and further improved on from [@cmaron](https://github.com/cmaron/CS-7641-assignments) and [@mmallo3](https://github.gatech.edu/mmallo3/CS7641_Project4).

Setup your Python 3 environment with `pip3` and the required libraries and their respective versions in the `requirements.txt` file.

```
pip3 install -r requirements.txt
```

The `run_experiment.py` script can be use to process all the experiments and plot the standard figures. Note: your run may differ because of the random initial seeds. The outputs used in the report and their objects (e.g., `pkl` files) are in the `output` folder.

```
python3 run_experiment.py --plot --all --threads 4 --verbose
```

I also deviated from @cmaron and @mmallo3 by using my own `plot.R` script for custom figures from the run outputs.
