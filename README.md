Human-Activity-Recognition
==========================

Project for Coursera "Getting and Cleaning Data" course

##Overview of Project
This project converts a large amount of raw data measuring the body movements of human subjects doing different physical activities into a “tidy” data set for subsequent analysis.

In addition to this README.md file, this repository contains:
* R script processing the source data into a  data set that summarizes the measures by subject and type of activity
* Text file containing the data set
* A code book for the data set

##Source Data Files
A group of 30 volunteers each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphone’s embedded accelerometer and gyroscope captured different measurements of physical movement at regular intervals. The obtained data set was randomly split into two parts (70% used as training data; 30% used as test data).

For more information on the experiment and the data, see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set was partitioned into seven files
* X_train.txt: 7352 observations of 561 variables that comprise the training data set
* X_test.txt: 2947 observations of 561 variables that comprise the test data set
* feature.txt: names for each of the 561 variables
* subject_train.txt: the ID number of the subject associated with each of the 7352 observations in the training data set
* subject_test.txt: the ID number of the subject associated with each of the 2947 observations in the test data set
* y_train.txt: the activity associated with each of the 7352 observations in the training data set
* y_test.txt: the activity associated with each of the 2947 observations in the test data set

##Data Processing
The “run_analysis.R” executes a four-step process that converts the source data into an analyzable data set:

###1.Create a “combined” data set
The individual source files listed above are stitched together into a single “master” file by:
* appending the test observations (X_test.txt) to the end of the training observations (X_train.txt)
* appending the list of test subject IDs (subject_test.txt) to the end of the list of training subject IDs (subject_train.txt)
* appending the list of activities associated with the test observations (y_test.txt) to the end of the lit of activities associated with the training observations (y_train.text)
* combining the observation data, the subject IDs, and the activities into a single data set
* assigning the variable names from the source data (feature.txt) to the combined data set.

###2. Extract variables of interest
As noted above, 561 measurements are included in the original data.  The body movement being measured (ex. “acceleration” and “jerk”), the axis of the movement (X,Y or Z) and whether the data measured time or frequency produced 33 different combinations.  In addition, 17 different statistical methods were used to summarize individual readings (ex. mean, standard deviation, min, max, entropy, skewness, kurtosis).  [Note: All 17 methods may not be defined for each combination.]  Limiting the data set to only the subset of “mean” and “standard deviation” measures creates a more manageable, 68-variable (66 measurements + subject ID +activity code) data set.

###3. Make variable values and names more user-friendly
Two aspects of coding the original source data may cause difficulties for other users of the data.

First, the “Activity” variable was captured as a numeric value from 1 to 6, the meaning of which would not be apparent to a new user.  These numeric values are replaced by text that describe the activity using commonly understood text (“WALKING”, “WALKING_UPSTAIRS”, etc.)

Second, the variable names themselves have characters that can create difficulties when right expressions in R (ex. “()”).  In addition, the long and unclear structure of variable names makes it difficult to understand what each variable might mean.  The R script modifies the variable names to create shorter names with a common structure:

* the first four characters indicate the statistical function used to summarize the readings (“Mean” and “StDv”)
* after an underscore, the six character indicates whether the observation is a measure of time (t) or frequency (f)
* characters after that define the body movement being measured
* for those measurements that involve an axis, the last two characters of the variable name indicates that axis (“_X”,”_Y”,”_Z”)

###4. Aggregate data by subject and activity
Each of the 30 subjects did each of the six activities over a period of time, generating 10,299 observations in total.  The R script collapses these observations into a smaller data set of 180 observations by taking the mean of the measurements for each subject/activity combination.
 