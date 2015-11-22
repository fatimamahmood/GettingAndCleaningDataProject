# This script is written for the Coursera Getting and Cleaning Data
# course project, the goal of which is to reproducibly create
# a tidy data set.

library(reshape2)

# Read the data into R
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testMeasurements <- read.table("UCI HAR Dataset/test/X_test.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
trainMeasurements <- read.table("UCI HAR Dataset/train/X_train.txt")

# Merge the data
testData <- cbind(testSubjects, testActivities, testMeasurements)
trainData <- cbind(trainSubjects, trainActivities, trainMeasurements)
data <- rbind(testData, trainData)

# Read feature names into R
features <- read.table("UCI HAR Dataset/features.txt")

# Name the columns in the merged data, using given feature names
idNames <- c("subject", "activity")
names(data) <- c(idNames, as.character(features[,2]))

# Identify indices of features that are mean or standard deviation values
indices <- c(grep("mean()", features$V2, fixed = TRUE), 
           grep("std()", features$V2, fixed = TRUE))

# Extract the feature names that are mean or standard deviation values
relevantFeatures <- features[indices,2]

# Extract only the data involving mean or standard deviation values
# from the merged data
relevantData <- data[, c(idNames, as.character(relevantFeatures))]

# Read activity names into R
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
numActivity <- nrow(activityLabels)

# Replace integer activity labels with descriptive factor labels
relevantData$activity <- cut(relevantData$activity, breaks = numActivity,
                             labels = activityLabels[,2], include.lowest = TRUE)

# Convert integer subject identities to factor
# (not necessary but makes sense considering this is an idenfication variable)
relevantData$subject <- as.factor(relevantData$subject)

# Modify the variable names to be more descriptive
nameVec <- names(relevantData)
nameVec <- gsub("-", "", nameVec, fixed = TRUE)
nameVec <- gsub("()", "", nameVec, fixed = TRUE)
nameVec <- gsub("mean", "Mean", nameVec, fixed = TRUE)
nameVec <- gsub("std", "StdDev", nameVec, fixed = TRUE)
nameVec <- gsub("Acc", "Acceleration", nameVec, fixed = TRUE)
nameVec <- gsub("Gyro", "Gyroscope",  nameVec, fixed = TRUE)
nameVec <- gsub("Mag", "Magnitude", nameVec, fixed = TRUE)
nameVec <- gsub("BodyBody", "Body", nameVec, fixed = TRUE)
names(relevantData) <- nameVec

# Now we create the tidy data set containing the average of each variable
# for each (subject, activity) pair

# First, melt the data to turn it from wide to long format
dataMelt <- melt(relevantData, id = idNames)

# Next, cast the data back to wide format where each row corresponds
# to a (subject, activity) pair and the columns contain the average
# of each variable for the (subject, activity) pair
resultData <- dcast(dataMelt, subject + activity ~ variable, mean)

# Finally, write the data set to the output file
write.table(resultData, "TidyData.txt", row.names = FALSE)