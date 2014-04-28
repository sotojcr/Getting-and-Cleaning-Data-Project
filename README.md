##Getting-and-Cleaning-Data-Project
=================================

## Program run_analysis.R 
=========================
 Execute from the R console:

source("run_analysis.R")
runAnalysis()

This program does the following:
 

* read training and test data ("X_train.txt" and "X_test.txt")
* read id's data ("subject_train.txt" and "subject_test.txt")
* read activity names file ("features.txt")
* Merge the training and the test sets to create one data set.
* Use descriptive activity names to name the activities in the data set. Appropriately label the data set with descriptive activity names (Use colnames function)                    
* Extract only the measurements on the mean and standard deviation for each measurement (Use grepl function).  
* merging subject IDs with the data frame 
* Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
* Transpose the data (id's: column -> row, var: row ->column)
* Write the data on the file "tidyData.txt"
