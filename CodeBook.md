
## Project Description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

 

##Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

###Collection of the raw data

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

 
##Creating the tidy data file

 
###Guide to create the tidy data file
1.	Download the getdata_projectfiles_UCI HAR Dataset.zip file. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2.	Unzip the file into the a folder, “C:/UCI HAR Dataset”
3.	Download the run_analysis.R script into the same folder for the raw data “C:/UCI HAR Dataset”.
4.	Execute the “run_analysis.R” script in RStudio, 
a.	Change the work directory to the “UCI HAR Dataset” folder  setwd(“C:/UCI HAR Dataset”)
b.	source(“run_analysis.R”)
5.	The script will produce the “Tidy Data Set with the Average.txt” in the C:/UCI HAR Dataset folder.  It is a txt file that contains the tidy data set (180 * 68 dimensions) with the average of each variable for each activity and each subject. There are 6 activities and 30 subjects.  Therefore the data contains 180 rows and 68 columns (2 descriptive column, subject and activity, and 66 columns for measures).
6.	Use data <- read.table("Tidy Data Set with the Average.txt ") command in RStudio to read the file. 

 
 
 
###Cleaning of the data
1.	Read X_train.txt and X_test.txt files from into data frame x_train and x_test, then concatenate into data frame x_data.
2.	Read subject_train.txt and subject_test.txt files from into data frame subject_train and subject_test, then concatenate into data frame subject_data.
3.	Read Y_train.txt and Y_test.txt files from into data frame y_train and y_test, then concatenate into data frame y_data.
4.	Read 561 variables from the features.txt and store into features data frame.
5.	Use grep function and regular expression ("-mean\\(\\)|-std\\(\\)" to get a list that has the variables containing mean() and Std() from the features data frame then stored into mean_std_features data frame.
6.	Get the subset of the x_data based on the mean_std_features list and store into x_data_interested data frame.
7.	Label the column name for x_data_interested data frame.
8.	Read activity_labels.txt and store into activities data frame.
9.	The y_data contains activity as integer value and descript name is stored in the activities data frame.  We need to replace the integer value with descriptive name value in each of row of y_data.  We will do a left out join for y_data with activities using a subscript method.
10.	Label the y_data with name activity.
11.	Label the subject_data with name subject.
12.	Combine all column from subject_data, y_data, x_data_interested and store into one all_interested_data data frame.
13.	A tidy data set is created from the above all_interested_data with the average of each variable. We will use the ddply function to split data frame by subject and activity,then calculate the column mean for all columns.  Before we can use the ddply funciton we need to import the plyr R package to Rstudio.  Store the tidy data into averages_all_interested_data data frame.
14.	Write the data frame into a text file, "Tidy Data Set with the Average.txt", in current working directory.  

 

##Description of the variables in the "Tidy Data Set with the Average.txt" file
 

 - Dimensions of the dataset
     180 * 68
 - Summary of the data: 
     Data is the mean value for each of the following 66 variable from six subjects per activity.  
 - Variables present in the dataset
*               tBodyAcc-mean()-X          
*		tBodyAcc-mean()-Y 
*		tBodyAcc-mean()-Z 
*		tBodyAcc-std()-X           
*		tBodyAcc-std()-Y 
*		tBodyAcc-std()-Z 
*		tGravityAcc-mean()-X 
*		tGravityAcc-mean()-Y 
*		tGravityAcc-mean()-Z 
*		tGravityAcc-std()-X 
*		tGravityAcc-std()-Y 
*		tGravityAcc-std()-Z 
*		tBodyAccJerk-mean()-X 
*		tBodyAccJerk-mean()-Y 
*		tBodyAccJerk-mean()-Z 
*		tBodyAccJerk-std()-X 
*		tBodyAccJerk-std()-Y 
*		tBodyAccJerk-std()-Z 
*		tBodyGyro-mean()-X 
*		tBodyGyro-mean()-Y 
*		tBodyGyro-mean()-Z 
*		tBodyGyro-std()-X 
*		tBodyGyro-std()-Y 
*		tBodyGyro-std()-Z 
*		tBodyGyroJerk-mean()-X 
*		tBodyGyroJerk-mean()-Y 
*		tBodyGyroJerk-mean()-Z 
*		tBodyGyroJerk-std()-X 
*		tBodyGyroJerk-std()-Y 
*		tBodyGyroJerk-std()-Z 
*		tBodyAccMag-mean() 
*		tBodyAccMag-std() 
*		tGravityAccMag-mean() 
*		tGravityAccMag-std() 
*		tBodyAccJerkMag-mean() 
*		tBodyAccJerkMag-std() 
*		tBodyGyroMag-mean() 
*		tBodyGyroMag-std() 
*		tBodyGyroJerkMag-mean() 
*		tBodyGyroJerkMag-std() 
*		fBodyAcc-mean()-X 
*		fBodyAcc-mean()-Y 
*		fBodyAcc-mean()-Z 
*		fBodyAcc-std()-X 
*		fBodyAcc-std()-Y 
*		fBodyAcc-std()-Z 
*		fBodyAccJerk-mean()-X 
*		fBodyAccJerk-mean()-Y 
*		fBodyAccJerk-mean()-Z 
*		fBodyAccJerk-std()-X 
*		fBodyAccJerk-std()-Y 
*		fBodyAccJerk-std()-Z 
*		fBodyGyro-mean()-X 
*		fBodyGyro-mean()-Y 
*		fBodyGyro-mean()-Z 
*		fBodyGyro-std()-X 
*		fBodyGyro-std()-Y 
*		fBodyGyro-std()-Z 
*		fBodyAccMag-mean() 
*		fBodyAccMag-std() 
*		fBodyBodyAccJerkMag-mean() 
*		fBodyBodyAccJerkMag-std() 
*		fBodyBodyGyroMag-mean() 
*		fBodyBodyGyroMag-std() 
*		fBodyBodyGyroJerkMag-mean() 
*		fBodyBodyGyroJerkMag-std()


##  Abbreviations for the variables

*		t           Time
*		f           Frequency
*		Acc         accelerometer
*	    	Gyro        gyroscope
*		Body        Body
*		Gravity     Gravity
*		Jerk	    Jerk Movement
*		Mag         magnitude 
*		mean()      mean 
*		std()       Standard deviation
*		X           axial X
*               Y           axial Y
*		Z	    axial Z
		
 

##References

(1) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
 


