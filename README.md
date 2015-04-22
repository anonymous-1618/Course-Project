# Course-Project
Getting and Cleaning Data Course Project Assigment

***************************************************
###This project has three files with the relevant informations:

1.	README.md (present)
2.	run_analysis.R 
3.	CodeBook.txt

###This project is to develop a script (run_analysis.R) that can:

1.	Merge the training and the test sets to create one data set.
2.	Extract only the measurements on the mean and standard deviation for each measurement. 
3.	Use descriptive activity names to name the activities in the data set
4.	Appropriately label the data set with descriptive variable names. 
5.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

###The developed script "run_analysis.R" is able to:

1.	Download and Unzip a compressed data from a provided URL.
2.	Load to R Global environment the files from their respective folders.
3.	Combine the test and train data.
4.	Clean the data by considering the rules of tidy data, and labelling the variables with descriptive names. 
5.	Select the data and create a new tidy data (NewTidyData).
6.	Calculate the mean and standard deviation of the selected variables.
7.	Use the activity names in the new data set.
8.	Export the tidy data.

The variables description of the NewTidyData is presented in the CodeBook.txt with some level of detail.

NB: Because of the previous assignment where my peers have complained the I did not make a detailed comment in my script, this time,
the script has a description of each important step and it is aligned to the items 1 to 8 described above.
This project did not include the raw data presented in the folders "Inertial Signals" since it was not necessary as remarked bythe course Tutor: https://class.coursera.org/getdata-013/forum/thread?thread_id=30

This work should be read in conjunction of the readme.txt and features_info.txt files that are provided with the original data(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
A summary of content of such files are presented bellow: 

***************************************************
30 volunteers were asked to wear two type of sensors: accelerometer and gyroscope.

The volunteers were asked to perform the following 6 activities: 
Walking, Walking Upstairs, Walking Downstairs, Sitting Standing, and Laying.

Data were collected at a constant rate of 50Hz for 3-axial linear acceleration and 3-axial angular velocity.

For a data analysis the full dataset was split into train and test sets:

*   70% of data volunteers for train set
*   30% of data volunteers for test set

For each record the following is provided:

*  Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*  Triaxial Angular velocity from the gyroscope. 
*  A 561-feature vector with time and frequency domain variables. 
*  Its activity label. 
*  An identifier of the subject who carried out the experiment.

The dataset includes the following files:

*  'features_info.txt': Shows information about the variables used on the feature vector.
*  'features.txt': List of all features.
*  'activity_labels.txt': Links the class labels with their activity name.
*  'train/X_train.txt': Training set.
*  'train/y_train.txt': Training labels.
*  'test/X_test.txt': Test set.
*  'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

*  'train/subject_train.txt': 
    Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
*  'train/Inertial Signals/total_acc_x_train.txt':
    The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
*  Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt'
    and 'total_acc_z_train.txt' files for the Y and Z axis. 
*  'train/Inertial Signals/body_acc_x_train.txt': 
    The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
*  'train/Inertial Signals/body_gyro_x_train.txt': 
    The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

***************************************************
####Reference:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, 
Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
