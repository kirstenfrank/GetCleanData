GetCleanData
============

for the Getting and Cleaning Data project

## Overview and use
run_analysis does all the steps in the project.
To read the tidy dataset in, use read.table.

## details
First, it downloads the zipped file.
Then it unzips the directory structure and files.

It pulls out the files to create a training set (with activity values and subject ID values), and 
a test set (with activity values and subject ID values). The activity values and subject ID values are 
placed at the beginning of each set using cbind.

1)    Merges the training and the test sets to create one data set.

1.5) labels with the descriptive variable names (step 4).  These are read in from features.txt. 
The features vector has to have subject ID and Activity added to it in the same order that cbind put them.
 This is done by removing forbidden characters, making commas into underscores,
 and expanding the initial t to time and the initial f to freq. 
 The variable names were left in CamelCase to provide a visual clue when words were combined.

2)    Extracts only the measurements on the mean and standard deviation for each measurement. 
This was done by selecting only variables that had mean and std in them. Mean was found to be present
with an initial capital letter, as well as with a lower case initial letter.

3)    Uses descriptive activity names to name the activities in the data set.
The descriptive activity names were found in activity_lables.txt. 
The format was left basically the same, except underscores were removed.


4)    Appropriately labels the data set with descriptive variable names.
Done in step 1.5 

5)    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
The aggregate does this. This dataset is called tidydata and is written out as tidydata.txt.

## Experiment and variable details
The experiment was performed using accelerometers and gyroscopes in smartphones (Samsung).
The 30 subjects wore the smartphones on the waist.
Activities were coded using manual observation of video-tapes of the subjects.

Variables are the subject ID and the activity and direct and calculated measures from the 
accelerometers and gyroscopes. For this analysis, only those calculated measures
involving mean or standard deviation were used. The mean of each of those measures was 
calculated for each subject-activity combination.

# Acknowledgements

Data was collected by Samsung. 
Data is stored at the University of California-Irvine in the Machine Learning Repository. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Descriptions are based heavily on the interpretations from Jeff Leek (written in the assignment)
and the CTAs, David Hood and Wendel Hope in the Forum 
https://class.coursera.org/getdata-005/forum/thread?thread_id=23
And all contributors to that thread.
