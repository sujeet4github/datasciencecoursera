# Getting and Cleaning Data Course Project
#### Data Codebook For data located in getdata_projectfiles_UCI HAR Dataset.zip

The zip file has been downloaded from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


A full description is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

DataSet consists of

* File - activity_labels.txt
    + 6 lines
		+ 2 values in each line (activity_id & activity_name)
    + activities being - LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
* File - features.txt
    + 561 lines
    + 2 values in each line (feature_id, feature_name)
* two folders
    + **test** and **train**
    + Each has a file subject_test.txt or subject_train.txt
        + has 2947 lines in test, 7352 lines in training
        + 1 value in each line, the subject id with values 1 - 30
    + Each has a file	X_???.txt
        + 561 feature vector with time and frequency domain variables
        + has 2947 lines in test, 7352 lines in training
        + 561 values in each line
        + each value: 16 chars
    + Each has a file y_???.txt
        + has 2947 lines in test, 7352 lines in training
        + 1 value in each line, the activity_id
    + Each has a sub folder: Inertial Signals
        + Has the following files
        + body_acc_x,  body_acc_y,  body_acc_z
            + total acc - gravity, in x, y and z coordinates
        + body_gyro_x, body_gyro_y, body_gyro_z
            + angular velocity from gyroscop, units radians/sec, in x, y and z coordinates
        + total_acc_x, total_acc_y, total_acc_z
            + acceleration signal in std gravitational units 'g', in x, y and z coordinates
	      + Each file
            + is a 128 element vector
            + has 2947 lines in test, 7352 lines in training
            + 128 values in each line
            + each value: 16 chars

#### Data Codebook For aggregatedData.txt
The Following transformations have been performed on the initial data set

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

* File has 180 observations (lines) of 89 variables
    + each of these variables are average (mean) of
        + only the mean and standard deviation measurements in the original dataset
