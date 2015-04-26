# Code Book for run_analysis.R

Subjects were part of an experiment in which they wore a Samsung Galaxy smartphone to record information about various movements, such as sitting, walking, etc.

## The dataset and goals

Information, called the UCI HAR Dataset, was obtained online for test and training data. The goal of this R script was to create one tidy data set for the average of each variable for each subject.

## The files

The files were read into R and named respectively. Inertial signals folders were ignored for the purpose of this analysis.

* `features.txt`: names of the different features being recorded
* `activity_labels.txt`: names of the activities of interest and corresponding IDs

###Training set
* `X_train.txt`: observations of the 561 features for 21/30 volunteers
* `subject_train.txt`: ID of the volunteers and the information gathered regarding the observations
* `y_train.txt`: ID of the activity to the observations
###Test set
* `X_test.txt`: observations of the 561 features for 9/30 volunteers
* `subject_test.txt`: ID of the volunteers and the information gathered regarding the observations
* `y_test.txt`: ID of the activity to the observations

## Steps to tidy up data
1) Load the .txt files into R using read.table() and labeled readable names for the different sets and activities. Combined to make one dataset called `data`.
2) Located appropriate columns for mean and standard deviation. Extra columns were included for subject ID and activity were considered, for total of 88 columns.
3-4) Treated activities as factors and applied them to `data`.
5) Loaded the reshape2 package and used melt() and dcast() to make a data set. 