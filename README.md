# Cleaned-Smartphones-Human-Activity-Recognition-Data-Set

This Project used Human Activity Recognition Using Smartphones Data Set which can be obtained from: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
The cleaned data set used the following raw data sets:

=========================================
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
===========================================

First of all, training and test data sets (X_train.txt, X_test.txt) were combined. And the column names are imported from features.txt. Secondly, only columns of mean and standard deviation for each measurement were kept. Thirdly, subject identifiers were written in from subject_train.txt and subject_test.txt. Activity labels were merged in the data from y_train.txt and y_test.txt and matched with activity names from activity_labels.txt. Lastly column names were tidied. The final data set is 

'testtrain.txt'

A second tidy data was also created. Rows in ‘testset.csv’ were grouped by 6 activities and 30 subjects. The variables in ‘testset.csv’ were averaged in the 180 groups. The second tidy data is 

'AvgSubjectActivity.txt'
