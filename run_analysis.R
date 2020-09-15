## Loading dplyr Library

library(dplyr)

##Getting and Setting Working Directory
getwd()
setwd(setwd("C:/Users/USER/Desktop/R/Johns Hopkins/Getting and Cleaning Data/UCI HAR Dataset")


## Reading Training datasets

x_train <- read.table("./train/X_train.txt", col.names = features$functions)
y_train <- read.table("./train/y_train.txt", col.names = "code")
sub_train <- read.table("./train/subject_train.txt", col.names = "subject")

## Reading Test data

x_test <- read.table("./test/X_test.txt", col.names = features$functions)
y_test <- read.table("./test/y_test.txt", col.names = "code")
sub_test <- read.table("./test/subject_test.txt", col.names = "subject")

## Reading features description 

features <- read.table("./features.txt" , col.names = c("n","functions"))

## Reading activity labels

activities <- read.table("./activity_labels.txt", col.names = c("code", "activity"))

## Merging the training and the test datasets to create one data sets

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(sub_train, sub_test)
Merged_Data <- cbind(Subject, Y, X)

## Extracting the measurements on the mean and the standard deviation for each 
## measurement. 

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

## Using descriptive activity names to name the activities in the data set.

TidyData$code <- activities[TidyData$code, 2]

## Labeling the data set with descriptive variable names

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

## Creating an independent tidy dataset with the average of each variable for 
## each activity and each subject

FinalData <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)