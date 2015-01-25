
## Requirements Specified:
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with
##    the average of each variable for each activity and each subject.



### Function: readData
# Inputs specify the information required to read data from 3 file:
# prefixed: X, y and subject respectively.
#
# the directory name and the common file suffixes are parameters to the method
#
# Data from these 3 files are merged into 1 data frame for easier processing.
# Data is also labelled with descriptive variable names
#
###
readData <- function(dirName, fileSuffix, activityData, featuresData) {
  
  if (file.exists(dirName)) {

    # Subject information
    subjectData <- read.table(file.path(dirName, paste("subject", fileSuffix, sep='')))
    names(subjectData) <- c("SubjectId")

    # Not using this as it is too slow... use read.table instead
    ## colWidths <- rep(16, 562)
    ## XData <- read.fwf(file.path(dirName, paste("X", fileSuffix, sep='')), colWidths)
    
    XData <- read.table(file.path(dirName, paste("X", fileSuffix, sep='')))

    # Reqt #4 - Appropriately labels the data set with descriptive variable names.
    # The variable names are not pretty, but choosing not to change the column names here,
    # I'm assuming that they make sense as is to a domain specialist who will look at the data.
    #
    features <- featuresData[,2]    
    names(XData) <- features

    yData <- read.table(file.path(dirName, paste("y", fileSuffix, sep='')))
    names(yData) <- c("ActivityId")

    # Returned table will have the following columns: SubjectId, ActivityId, followed by columns of XData
    #
    return (cbind(subjectData, yData, XData))
 
 } else {
 
 	cat(dirName, " does not exist\n")
  }
}


# Begin Main Method

# Read and Setup Column Names
activityData <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityData) <- c("ActivityId", "ActivityName")

# Read and Setup Column Names
featuresData <- read.table("./UCI HAR Dataset/features.txt")
names(featuresData) <- c("FeatureId", "FeatureName")

testFolder <- "./UCI HAR Dataset/test"

testData <- readData(dir=testFolder,
                     fileSuffix="_test.txt",
                     activityData=activityData,
                     featuresData=featuresData)

trainFolder <- "./UCI HAR Dataset/train"

trainData <- readData(dir=trainFolder,
                     fileSuffix="_train.txt",
                     activityData=activityData,
                     featuresData=featuresData)


# Reqt #1 - Merges the training and the test sets to create one data set.
#
mergedData <- rbind(testData, trainData)

# Reqt #2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
measurements <- names(mergedData)
measurementSubset <- grep("SubjectId|ActivityId|.*Mean.*|.*-mean().*|.*-std().*", measurements)
subSetData <- mergedData[,measurementSubset]

# Reqt #3 - Uses descriptive activity names to name the activities in the data set.
#
subSetDataWithActivityName <- merge(activityData, subSetData, by='ActivityId')

# Reqt #4 - Appropriately labels the data set with descriptive variable names.
#
# - Is being done when reading data in readData() function

## Reqt #5 - From the data set in step 4, creates a second, independent tidy data set with
##    the average of each variable for each activity and each subject.

listToAggregateOn <- list(SubjectId=subSetData$SubjectId, ActivityId=subSetData$ActivityId)

aggregatedData <- aggregate(subSetData[,names(subSetData) != c("SubjectId", "ActivityId")],
                                listToAggregateOn,
                                FUN=mean)

write.table(aggregatedData, file = './aggregatedData.txt', row.names = FALSE)
