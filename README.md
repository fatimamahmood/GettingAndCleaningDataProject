# Coursera Getting and Cleaning Data Project

This README file explains how to use the accompanying `run_analysis.R` code in order
to tidy up the data from
[`http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
according to the course project guidelines.

In summary, the project asked to create a script called `run_analysis.R` that would

1. Merge the training and test sets to create one data set.
2. Extract the mean and standard deviation feature measurements.
3. Label the activities with descriptive activity names.
4. Label the measurement variables with descriptive names.
5. Create a tidy data set consisting of the average of each feature measurement for each subject, activity pair.

## Preliminary Tasks

The data needs to be obtained before the script can be run. To do this:

1. Download the Human Activity Recognition Using Smartphones Dataset in the form of a zipped data folder from
[`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Unzip the data into your working directory. This will result in a folder named
`UCI HAR Dataset`, which contains all the data and various descriptive files.

## Running `run_analysis.R`

The script `run_analysis.R` will tidy the data according to the project instructions (see above). To use it:

1. Put `run_analysis.R` in your working directory (the same one in which the original data was unzipped).
2. Make sure you have the `rshape2` package installed in R. If not, install it.
3. From your working directory, run the script using the command `source(“run_analysis.R”)`.

## The Output

The script `run_analysis.R` merges the training and test data sets, extracts only the mean and standard deviation measurements, replaces activity identifiers with descriptive labels, assigns feature variables descriptive names, then finally
creates a tidy data frame in R containing the average of each feature measurement for each subject, activity pair. It calls this data frame `resultData`.

Then it writes this data frame out to the file `TidyData.txt` in the working directory.

The tidy data can be read into R using the command `read.table(“TidyData.txt”, header = TRUE)`.

Please note that the tidy data created by `run_analysis.R` is in a wide format. Each row corresponds to a unique subject, activity pair, and the rest of the row contains the averages of the feature measurements for that subject, activity pair. The data is tidy because each variable occurs in a column, each observation occurs in a row, and the single table in the result has only one kind of observational unit.

For more information on the transformations that `run_analysis.R` applies to the original data and for more information on the variables used in the resultant tidy data set, please see the Code Book, which is included as `CodeBook.md` in this repository.

