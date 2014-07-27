GetCleanData
============

for the Getting and Cleaning Data project


run_analysis does all the steps in the project.
First, it downloads the zipped file.
Then it unzips the directory structure and files.

It pulls out the files to create a training set (with activity values and subject ID values), and 
a test set (with activity values and subject ID values).
1)    Merges the training and the test sets to create one data set.
1.5) labels with the descriptive variable names (step 4)
2)    Extracts only the measurements on the mean and standard deviation for each measurement. 
3)    Uses descriptive activity names to name the activities in the data set
4)    Appropriately labels the data set with descriptive variable names. 
5)    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
