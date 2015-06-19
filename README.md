# Getting-and-Cleaning-Data

This is repository for the course project of the "Getting and Cleaning Data" class in coursrea's Data Science Track by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD from John Hopkins Unversity.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data used for this project were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data can be downloaded from the following site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 
##The R script, “run_analysis.R” will complete the following five tasks. 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
##Guide to create the tidy data file
1.	Download the getdata_projectfiles_UCI HAR Dataset.zip file. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2.	Unzip the file into the a folder, “C:/UCI HAR Dataset”
3.	Download the run_analysis.R script into the same folder for the raw data “C:/UCI HAR Dataset”.
4.	Execute the “run_analysis.R” script in RStudio, 
a.	Change the work directory to the “UCI HAR Dataset” folder  setwd(“C:/UCI HAR Dataset”)
b.	source(“run_analysis.R”)
5.	The script will produce the “Tidy Data Set with the Average.txt” in the C:/UCI HAR Dataset folder.  It is a txt file that contains the tidy data set (180 * 68 dimensions) with the average of each variable for each activity and each subject. There are 6 activities and 30 subjects.  Therefore the data contains 180 rows and 68 columns (2 descriptive column, subject and activity, and 66 columns for measures).
6.	Use data <- read.table("Tidy Data Set with the Average.txt ") command in RStudio to read the file. 

 



