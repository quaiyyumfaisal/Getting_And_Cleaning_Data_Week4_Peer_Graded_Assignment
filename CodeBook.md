---
title: "CodeBook of Getting_and_Cleaning_Data_Peer_Graded_Assignment"
author: "Faisal Quaiyyum"
date: "9/16/2020"
output: "FinalData.txt"



# Code Book
The "FinalData.txt" contains the average of each variable for each activity and 
each subject from the Human Activity Recognition Using Smartphones Data Set. 
Broadly 7 steps are being followed to complete the activity. 

## 1. Download the dataset
 - Dataset downloaded and extracted under the folder called **UCI HAR Dataset**.

## 2. Assign each data to variables
This appears as reading Training datasets, Test datasets, features description and 
activitvity labels in the code. 

 - `features` <- `features.txt` : 561 rows, 2 columns:
The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
 - `activities` <- `activity_labels.txt` : 6 rows, 2 columns:
Contains list of activities performed when the corresponding measurements were taken and 
its codes (labels).
 - `sub_test` <- `test/subject_test.txt` : 2947 rows, 1 column:
Contains test data of 9/30 volunteer(subjects) that were being observed.
 - `x_test` <- `test/X_test.txt` : 2947 rows, 561 columns:
Contains records featuring test data.
 - `y_test` <- `test/y_test.txt` : 2947 rows, 1 columns:
Contains test data of activities’code labels.
 - `sub_train` <- `test/subject_train.txt` : 7352 rows, 1 column:
Contains train data of 21/30 volunteer(subjects) that were being observed.
 - `x_train` <- `test/X_train.txt` : 7352 rows, 561 columns:
Contains records featuring train data.
 - `y_train` <- `test/y_train.txt` : 7352 rows, 1 columns:
Contains train data of activities’code labels.

## 3. Merge the training and the test sets to create one data set
This appears as merging the training and the test datasets to create one data-
sets in the code. 

 - `X`(10299 rows, 561 columns) is created by merging `x_train` and `x_test` 
using **rbind()** function.
 - `Y`(10299 rows, 1 column) is created by merging `y_train` and `y_test` 
using **rbind()** function.
 - `Subject`(10299 rows, 1 column) is created by merging `subject_train` and `subject_test` using **rbind()** function.
 - `Merged_Data`(10299 rows, 563 column) is created by merging `Subject`, `Y` and `X` using **cbind()** function.

## 4. Extract only the measurements on the mean and standard deviation for each measurement
This appears as extracting the measurements on the mean and the standard deviation for each measurement. 

 - `TidyData` (10299 rows, 88 columns) is created by subsetting `Merged_Data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and *standard deviation* (`std`) for each measurement

## 5. Use descriptive activity names to name the activities in the data set
This appears as using descriptive activity names to name the activities in the data set.

 - Entire numbers in `code` column of the `TidyData` replaced with corresponding activity taken from second column of the `activities` variable

## 6. Appropriately label the data set with descriptive variable names
This appears as labeling the data set with descriptive variable names

 - `code`column in `TidyData` renamed into `activities`.
 - All `Acc` in column’s name replaced by `Accelerometer`.
 - All `Gyro` in column’s name replaced by `Gyroscope`. 
 - All `BodyBody` in column’s name replaced by `Body`.
 - All `Mag` in column’s name replaced by `Magnitude`.
 - All start with character `f` in column’s name replaced by `Frequency`. 
 - All start with character `t` in column’s name replaced by `Time`.
 
## 7. Creates a second and independent tidy data set with the average of each variable for each activity and each subject.
This appears as Creating an independent tidy dataset with the average of each variable for each activity and each subject.

 - `FinalData`(180 rows, 88 columns) is created by sumarizing `TidyData` taking the means of each variable for each activity and each subject, after groupped by subject and activity. 
 - Export `FinalData` into `FinalData.txt` file.



