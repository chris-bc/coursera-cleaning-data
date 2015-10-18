# Summarise activity monitoring data

This script collates and averages mean and standard deviation activity data from the UCI activity monitoring dataset, including both test and training data.

### Installation
To use, place the script and UCI archive in the same directory and extract the UCI archive.

Run run_analysis.R and results will be output in a text file.

### Notes
All columns containing mean and SD data are included in the output.
The output generates a mean over all columns grouping by (Sample, Activity).

### Operation
The script read the test and training data in the UCI dataset, appending subject and activity details to each.
Test and training datasets are then merged using a new factor to distinguish teh two types of data.

All columns except for classificatory columns (Subject, Activity, Test/Training data type) and mean/std. dev. columns are then dropped from the dataset using activity labels.

Finally averages are taken over all parametric columns grouped by (Subject, Activity) and the results written to avgCols.txt

