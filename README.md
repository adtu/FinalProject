run_analysis R function
==================================================================

This function performs the following tasks:

1. Merge the training and the test sets to create one data set.
2. Appropriately label the data set with descriptive variable names.
3. Use descriptive activity names to name the activities in the data set.
4. Extract only the measurements on the mean and standard deviation for each measurement.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
==================================================================

The datasets created include the following data frames:
======================================================

- activity_labels : Links the class labels with their activity names read from original dataset activity_labels.txt.

- features : List of all features (variables) and their associated id's read from original dataset features.txt.

- subject_train : Used for training. Read from original dataset subject_train.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- X_train : Used for training dataset. Read from original dataset X_train.txt.

- y_train : Contains training labels. Read from original dataset train/y_train.txt.

_ subject_test : Used for test. Read from original dataset subject_test.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- X_test : Used as test dataset. Read from original dataset X_test.txt

- y_test : Contains test labels. Read from original dataset y_test.txt

- merged_subject : Merge of subject_train and subject_test 

- merged_X : Merge of X_train and X_test

- merged_y : Merge of y_train and y_test

- extracted_X : Extract of only mean and standard deviation for each measurement from merged_X dataset.

- mergedData : Column bind of merged_subject, merged_y$activity, and extracted_X

- mergedDataMelt : Melt data frame mergedData into subject, activity, and variables (features that were measured in observations)

- finalData : Tidy data set with the average of each variable for each activity and each subject.


====================================================================================================================================
Following is information about the original source of the data used in the function:
====================================================================================================================================

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÓ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
=======
FinalProject
============

