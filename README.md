# Getting and Cleaning Data Course Project
The goal is to prepare tidy data that can be used for later analysis.

### About the Data
A full description is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### Project Requirements
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

### Project Implementation
The project requirements have been implemented in a R script: run_analysis.R

**Note 1** the Inertial Signals data in the data set have been ignored, since there is no specific processing requirements.

**Note 2** the column names in the activity_labels are used as is. They may look difficult to read for me the data cleaner, but in the absense of other information, I'm assuming that they make sense to a domain specialist.

The method starts by

* reading activity meta data from the activity_labels.txt file.
* reading features meta data from the features.txt file.
* It then reads the test and train data using the readData function
    + The function readData encapsulates functionality of creating a data frame from the files in a folder. It:
        + merges the subject, y and x data
        + sets up column names appropriately
* the test and train data are merged into one dataset
* a subset of the data with only specified columns - the measurements with mean and std deviation
* finally it creates a new data set that is summarization of the data set created in the prior step
    + this data set is saved in "aggregatedData.txt".
        + This file has been uploaded to the project evaluation site as required.


### Attributions and License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
