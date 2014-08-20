# CODE CREATED FOR WINDOWS, 
##see the difference in path for MAC/Linux
## Mac?Linux Use "." instead of "~"

library(plyr)
library(qpcR)

# Read every file
features <- read.table("~/UCI HAR Dataset/features.txt") 

activityLabels <- read.table("~/UCI HAR Dataset/activity_labels.txt") 

### Train
trainFeatures <- read.table("~/UCI HAR Dataset/train/X_train.txt") 
trainActivity <- read.table("~/UCI HAR Dataset/train/Y_train.txt") 
trainSubjects <- read.table("~/UCI HAR Dataset/train/subject_train.txt") 

## Test
testFeatures <- read.table("~/UCI HAR Dataset/test/X_test.txt") 
testActivity <- read.table("~/UCI HAR Dataset/test/Y_test.txt") 
testSubjects <- read.table("~/UCI HAR Dataset/test/subject_test.txt") 

#assign names to Features
names(trainFeatures) <- features$V2
names(testFeatures) <- features$V2

#OK, now merge test and train to testDS and trainDS
trainDS <- cbind(trainFeatures, trainActivity, trainSubjects)
testDS <- cbind(testFeatures, testActivity, testSubjects)

#Let's make things clear
names(trainDS) <- sub ("t", "train_", names(trainDS))

nl <- nrow(trainDS)
nc <- ncow(trainDS)

#Just to cbind 
tmp <- data.frame(matrix(NA, nrow = nl- nrow(testDS) , ncol = nc))
names(tmp) <- names(testDS)
fulltestDS  <- rbind(tmp,testDS)

#voila, one tidy DS
fullDS <- cbind(trainDS, fulltestDS)
