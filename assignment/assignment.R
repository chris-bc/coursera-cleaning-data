#Create R script run_analysis.R that:
#1. Merges the training and the test sets to create one data set

library(dplyr)
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
testData <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features)
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
testData <- cbind(testData, testSubject, testActivity)

trainData <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))
trainData <- cbind(trainData, trainSubject, trainActivity)

testTrainFactor = factor(c("Test","Train"))
testData <- mutate(testData, dataType=testTrainFactor[1])
trainData <- mutate(trainData, dataType=testTrainFactor[2])

allData <- rbind(testData,trainData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement

#TODO: Revise text search and figure out how to do a contains to do colname contains .mean or colname contains .std
meanAndSDCols <- grep("mean|std|Subject|Activity|dataType", colnames(allData), ignore.case = TRUE)
meanAndSD <- allData[,meanAndSDCols]

#3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
activityFactors <- factor(activityLabels, ordered = TRUE)
meanAndSD$Activity<- activityFactors[meanAndSD$Activity]

#4. Appropriately labels the data set with descriptive variable names

# Done in step 1

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(data.table)
tidyData <- data.table(meanAndSD)
tidyData <- tidyData[, lapply(.SD, mean), by=c("Subject","Activity")]

setorder(tidyData, Subject, Activity, dataType)

write.table(tidyData, file="avgCols.txt")