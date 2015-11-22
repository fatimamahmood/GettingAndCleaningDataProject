# Code Book for Coursera Getting and Cleaning Data Project

## The Raw Data

The raw data was the Human Activity Recognition Using Smartphones Dataset, obtained from
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data itself was obtained in zipped format from
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

According to the README file included in the data folder, the measurements were obtained
from 30 people performing six activities while wearing the Samsung Galaxy S II smartphone.
The six activities were walking, walking upstairs, walking downstairs, sitting, standing,
and laying. The measurements obtained were linear acceleration and angular velocity from
the accelerometer and gyroscope embedded in the smartphone.

The original authors pre-processed this data using various filters, and also normalized
the measurements. So for each recorded observation, there is an identifier of the subject doing the activity, the activity label, the triaxial acceleration, the estimated body acceleration, the triaxial angular velocity, and several time and frequency domain variables.

For more information on how the original data was obtained and how it is organized
in the data set, please refer to the source website given above and to the various descriptive files included in the data folder.

## The Tidy Data

### Transformations Applied

First, the training and test data measurements, along with the subject list and activity list, were merged in order to create one data frame in which each row corresponded to a recorded observation. So each row contained a subject identifier, an activity identifier, and then the various feature measurements. This data frame was in a wide format. It’s important to note that each subject had several records taken at different times for each activity, so that several rows began with the same subject and activity pair.

Next, only the feature measurements that corresponded to mean values or standard deviations of the measured signals were extracted. This meant that only those features in the original data that had “mean()” or “std()” in their variable names were included.

The activity identifiers were replaced with more descriptive factor labels
and the subject identifiers were converted to factors as well.
The feature variables were assigned descriptive names, mostly editing the original variable names by expanding them to enhance readability and comprehension. For more information on each variable, please see the section below.

Then, the data was melted from wide format to long format, with the subject and activity being identifiers, and the remaining variables being the measure variables.
Then several average values were computed for each feature measurement, where
aach average value corresponded to a unique subject, activity pair. 
That is, 
for each feature measurement and each subject, activity pair, the average value 
of that feature measurement was computed over all observations of it obtained from 
that subject, activity pair.

The data was thus cast into long format again, which is the format of
the resultant tidy data.
Each row corresponds to a unique subject, activity pair, and each feature variable
corresponds to the average value of that feature variable over all the times it had been
measured for this subject, activity pair.

### Description of Variables

The resultant tidy data consists of 180 observations of 68 variables.

(Notice that since there were 30 people, each performing 6 tasks, it makes sense
to have 180 rows in the tidy data, each row corresponding to a unique subject,
activity pair.)

The first two variables serve to identify the subject and the activity. These variables are:

- subject : This is a factor with 30 levels “1”, “2”, “3”, … , “30”
- activity : This is a factor with 6 levels “WALKING”, “WALKING_UPSTAIRS”, “WALKING_DOWNSTAIRS”, “SITTING”, “STANDING”, “LAYING”

The remaining 66 variables are all numeric, taking on values in the range [-1,1].
They represent the average of the corresponding feature measurement
over all instances of the subject, activity pair in the original data. Since the original
feature measurements were normalized, these are all unitless variables. Note that the “t” stands for time domain signals and the “f” stands for frequency domain signals. Also, the “X”, “Y”, or “Z” indicate the directions in which the axial signals were measured. These variables are:

- tBodyAccelerationMeanX
- tBodyAccelerationMeanY
- tBodyAccelerationMeanZ
- tGravityAccelerationMeanX
- tGravityAccelerationMeanY
- tGravityAccelerationMeanZ
- tBodyAccelerationJerkMeanX
- tBodyAccelerationJerkMeanY
- tBodyAccelerationJerkMeanZ
- tBodyGyroscopeMeanX
- tBodyGyroscopeMeanY
- tBodyGyroscopeMeanZ
- tBodyGyroscopeJerkMeanX
- tBodyGyroscopeJerkMeanY
- tBodyGyroscopeJerkMeanZ
- tBodyAccelerationMagnitudeMean
- tGravityAccelerationMagnitudeMean
- tBodyAccelerationJerkMagnitudeMean
- tBodyGyroscopeMagnitudeMean
- tBodyGyroscopeJerkMagnitudeMean
- fBodyAccelerationMeanX
- fBodyAccelerationMeanY
- fBodyAccelerationMeanZ
- fBodyAccelerationJerkMeanX
- fBodyAccelerationJerkMeanY
- fBodyAccelerationJerkMeanZ
- fBodyGyroscopeMeanX
- fBodyGyroscopeMeanY
- fBodyGyroscopeMeanZ
- fBodyAccelerationMagnitudeMean
- fBodyAccelerationJerkMagnitudeMean
- fBodyGyroscopeMagnitudeMean
- fBodyGyroscopeJerkMagnitudeMean
- tBodyAccelerationStdDevX
- tBodyAccelerationStdDevY
- tBodyAccelerationStdDevZ
- tGravityAccelerationStdDevX
- tGravityAccelerationStdDevY
- tGravityAccelerationStdDevZ
- tBodyAccelerationJerkStdDevX
- tBodyAccelerationJerkStdDevY
- tBodyAccelerationJerkStdDevZ
- tBodyGyroscopeStdDevX
- tBodyGyroscopeStdDevY
- tBodyGyroscopeStdDevZ
- tBodyGyroscopeJerkStdDevX
- tBodyGyroscopeJerkStdDevY
- tBodyGyroscopeJerkStdDevZ
- tBodyAccelerationMagnitudeStdDev
- tGravityAccelerationMagnitudeStdDev
- tBodyAccelerationJerkMagnitudeStdDev
- tBodyGyroscopeMagnitudeStdDev
- tBodyGyroscopeJerkMagnitudeStdDev
- fBodyAccelerationStdDevX
- fBodyAccelerationStdDevY
- fBodyAccelerationStdDevZ
- fBodyAccelerationJerkStdDevX
- fBodyAccelerationJerkStdDevY
- fBodyAccelerationJerkStdDevZ
- fBodyGyroscopeStdDevX
- fBodyGyroscopeStdDevY
- fBodyGyroscopeStdDevZ
- fBodyAccelerationMagnitudeStdDev
- fBodyAccelerationJerkMagnitudeStdDev
- fBodyGyroscopeMagnitudeStdDev
- fBodyGyroscopeJerkMagnitudeStdDev

The resultant data is indeed tidy, because each variable occurs in a column, each observation occurs in a row, and the single table in our result has only one kind of
observational unit.
