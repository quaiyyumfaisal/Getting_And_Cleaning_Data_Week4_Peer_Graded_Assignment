## Peer-graded Assignment: Getting and Cleaning Data Course Project
The repository is the submission of peer-graded assignment of Getting and Cleaning Data course offered by Johns Hopkins University through Coursera. It contains instructions on how to do analysis on Human Activity Recognition dataset. 

## Dataset
Human Activity Recognition Using Smartphones. The source of the dataset can be found on this URL - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Code Description
The code combines the training dataset and the test dataset, and extracts partial variables to create another dataset with the averages of each variable for each activity.

## Files
1. CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

2. run_analysis.R shows the data analysis by following the following steps:
loading dplyr library,
getting and setting working directory,
reading Training datasets,
reading Test data,
reading features description,
reading activity labels, 
merging the training and the test datasets to create one data sets,
extracting the measurements on the mean and the standard deviation for each measurement,  
using descriptive activity names to name the activities in the data set,
labeling the data set with descriptive variable names,
creating an independent tidy dataset with the average of each variable for each activity and each subject.

3. FinalData.txt is the exported final data after going through all the sequences described above.

## New Dataset
FinalData.txt is the new dataset which contains variables which are calculated based on the mean and standard deviation. The rows of the new dataset is an average of each activity type for all the subjects. The coding was done with the help of instructions for this project. 
