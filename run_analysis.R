# run_analysis.R written 07/24/2014 by Kirsten Frank
# This is to meet requirements of Getting and Cleaning Data
# in the Data Science Specialization in the Coursera platform
# First section is download handling.
# Second section is loading data.
# Third section is putting data together.
# Fourth section is renaming variables and factors.
# Fifth section is writing out the first clean dataset.
# Sixth section is 

if (!file.exists("../data")) {
    dir.create("../data")
}  #make directory for storing the downloaded file and the unzipped data

#URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(URL, destfile = "../data/GCD.zip", method="curl")    
# download is commented out to avoid repeating all the time
# unzip("../data/GCD.zip",exdir = "../data/")
# unzip is commented out to avoid doing it every time.
dir("../data")
# dateDownloaded<-date()
# dateDownloaded

# Rename directory without any spaces
# file.rename(from="../data/UCI HAR Dataset", to="../data/ActivityDataset")

ytest<-read.table("../data/ActivityDataset/test/Y_test.txt")
xtest<-read.table("../data/ActivityDataset/test/X_test.txt")
ytrain<-read.table("../data/ActivityDataset/train/Y_train.txt")
xtrain<-read.table("../data/ActivityDataset/train/X_train.txt")
subtest<-read.table("../data/ActivityDataset/test/subject_test.txt")
subtrain<-read.table("../data/ActivityDataset/train/subject_train.txt")

train<-cbind(subtrain,ytrain,xtrain)
test<-cbind(subtest,ytest,xtest)
dataset<-rbind(train,test)

# start labelling columns
features<-read.table("../data/ActivityDataset/features.txt",stringsAsFactor=FALSE)
features<-features[,2]
features<-t(features)
features<-as.vector(features)


# Now we have a vector of labels for the columns, but it contains 
# non-standard names. Do string processing on this vector 
# BEFORE loading it into the names area. 
# It also needs Activity as the first element (and all other names pushed 
# back by one)
features<-gsub("-","",features)
features<-gsub("\\()","",features)
features<-gsub("\\(","",features)
features<-gsub("\\)","",features)
features<-gsub("\\,","_",features)
features<-gsub("BodyBody","Body",features)
features<-gsub("anglet","angletime",features)
features<-sub("^t","time",features)
features<-sub("^f","freq",features)
features<-c("subjectID","Activity",features)


# Assign the names to the variables.
names(dataset)<-features

# Now get rid of all unused variables.
selection<-grep("([Mm]ean|std)",features,value=TRUE)
selection<-c("subjectID","Activity",selection)

dataset<-dataset[,selection]


# assign activity labels to the 6 types of activity
activitylabels<-c("WALKING","WALKINGUPSTAIRS","WALKINGDOWNSTAIRS","SITTING","STANDING","LAYING")
dataset$Activity<-factor(dataset$Activity,labels=activitylabels)

# Calculate mean by subjectID and Activity, write to tidydata
tidydata<-aggregate(.~Activity+subjectID, data=dataset, FUN=mean)

# Output tidydata
write.table(tidydata,file="../data/tidydata.txt")

