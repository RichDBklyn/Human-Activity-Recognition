Human-Activity-Recognition
==========================

Project for Coursera "Getting and Cleaning Data" course

##Overview of Project
This project converts a large amount of raw data measuring the body movements of human subjects doing different physical activities into a “tidy” data set for subsequent analysis.

In addition to this README.md file, this repository contains:
* R script processing the source data into a  dataset that summarizes the measures by subject and type of activities
* Text file containing the tidy dataset
* A code book for the dataset

##Source Data Files
A group of 30 volunteers each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphone’s embedded accelerometer and gyroscope captured 561 different measurements at regular intervals. The obtained dataset was randomly partitioned into two sets (70% used as training data; 30% used as test data).

For more information on the experiment and the data, see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset was partitioned into seven files
*X_train.txt: 7352 observations of the 561 variables that comprise the training data set
*X_test.txt: 2947 observations of the 561 variables that comprise the test data set
*feature.txt: names for each of the 561 variables
*subject_train.txt: the ID number of the subject associated with each of the 7352 observations in the training data set
*subject_test.txt: the ID number of the subject associated with each of the 2947 observations in the test data set
*y_train.txt: the activity associated with each of the 7352 observations in the training data set
*y_test.txt: the activity associated with each of the 2947 observations in the test data set

 