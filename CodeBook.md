CodeBook of the Getting and Cleaning Data Course Project 

This is the code book for the getting and cleaning data course project.  It describes the project goal, the source file location, analysis, and references.

Project Goal
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Source File:
The data used for this project were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data can be downloaded from the following site: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Analysis:

The R script, “run_analysis.R” performs the following steps: 
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
13.	A tidy data set is created from the above all_interested_data with the average of each variable. We will use the ddply function to split data frame by subject and acitivty, then calculate the column mean for all columns.  Before we can use the ddply funciton we need to import the plyr R package to Rstudio.  Store the tidy data into averages_all_interested_data data frame.
14.	Write the data frame into a text file, Tidy Data Set with the Average.txt in current working directory.  We have 30 subjects and each subject has 6 activities therefore the file contains 180 rows (exclude the first row for column name) and 68 columns.  Data is the mean value of each activity per person.
References:
(1) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
