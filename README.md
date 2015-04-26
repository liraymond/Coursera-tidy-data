# Coursera-tidy-data
Project for Coursera. Tidying up data from raw .txt files.

# Downloading and preparing data for the script.
1) The source of data is from this URL below. Unzip.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2) These files must be moved to the same working directory so that R can read them (conveniently).
* `features.txt`
* `subject_train.txt`
* `subject_test.txt`
* `X_train.txt`
* `X_test.txt`
* `y_train.txt`
* `y_test.txt`

Run the R script, `run_analysis_R` to tidy up the data.

#Additional info
  * The unzipped directory contains `README.txt`, which includes information about the experiment.
  * `Inertial Signals` folder has been ignored for this analysis.
  * I referred to documentation online and Coursera lectures to understand the reshape2 package used in the script.
  * The output of the R script produces `tidy.txt`.
