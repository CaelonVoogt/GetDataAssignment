## Repository for the Get Data Assignment

# Getting and cleaning data
Creation of a tidy data set of wearable computing data originally collected from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files in this repo
•README.md -- This is the file that you are currently using
•CodeBook.md -- This is a codebook which describes the variables, data and transformations
•run_analysis.R -- This is the R code used to produce the tidy data set

## Outlines of the Assignment
You should create one R script called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset) 
{The script assumes it has in it's working directory the following files and folders:
•activity_labels.txt
•features.txt
•test/
•train/}

The output is created in working directory with the name of tidydata.txt

Note: This R script has been designed to run with the exclusion of any libraries for this course.


## Explanation of the run_analysis.R script:
The script is broken up into the same steps as the outlines of the assignment.

• Step 1:
Read all the test files (y_test.txt, subject_test.txt and X_test.txt)
Read all the training files (y_train.txt, subject_train.txt and x_train.txt)
Combine the files into a single data frame in the form of subjects, labels, the remaining data.

• Step 2:
Read the features file (features.txt) then filter it to only keeping means ("mean()") or standard deviations ("std()"). 
A new data frame is then created that includes subjects, labels and the described features.

•Step 3:
Read the activity labels file (activity_labels.txt) replacing the numbers with the text.

• Step 4:
Make a column list starting with "subjects" and "label", followed by the features
Tidy up the list by removing all non-alphanumeric characters and dropping the results all to lowercase
Apply the tidy column names to the data frame

• Step 5:
Create a new data frame by finding the mean for each combination of subject and label


• Export / Output step:
Write the new tidy set into a text file called tidydata.txt.