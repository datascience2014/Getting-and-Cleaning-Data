# This run_analysis.R script does the following 5 steps to combine data set, to extract desired data, to descriptively 
 # name acitivities, to appropriately labels the data set, and to creates a second, independent tidy data set.
 

 # 1.Merges the training and the test sets to create one data set.
 
 # Merges X data
    x_train <- read.table("train/X_train.txt") 
    x_test <- read.table("test/X_test.txt") 
    x_data <- rbind(x_train, x_test) 
 
 # Mergers subject data
    subject_train <- read.table("train/subject_train.txt") 
    subject_test <- read.table("test/subject_test.txt") 
    subject_data <- rbind(subject_train, subject_test) 
 
 # Mergers Y data
    y_train <- read.table("train/y_train.txt") 
    y_test <- read.table("test/y_test.txt") 
    y_data <- rbind(y_train, y_test) 
 

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

 # There are 561 variables in the data.  We only need to focus on the variables containg mean() and Std() in the features.txt. 
 # Get a list that has the variables coninging mean() and Std() in the features.txt. 
    features <- read.table("features.txt") 
    mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) 
 
 # Get the desired subset of data
    x_data_interested <- x_data[, mean_std_features] 
 
 # Correct the column name
    names(x_data_interested) <- features[mean_std_features, 2]
   

 # 3.Uses descriptive activity names to name the activities in the data set 
    
    activities <- read.table("activity_labels.txt") 
    
    # Do a left outer join with y_data on the left using a subscript method
    # example: df1[,"State"]<-df2[df1[ ,"Product"], "State"]
    y_data[, 1] <- activities[y_data[, 1], 2]
    
    names(y_data) <- "activity" 

 # 4.Appropriately labels the data set with descriptive variable names. 

    names(subject_data) <- "subject" 
    
    #combine three desired data set into one data set.
    all_interested_data <- cbind(subject_data, y_data, x_data_interested) 
   

 # 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
 # for each activity and each subject.
    library(plyr)
    # use ddply function to split data frame by subject and acitivty, then calculate the column mean for all collumns
    # column 1 (subject) and column 2 (activity)
    averages_all_interested_data <- ddply(all_interested_data, .(subject, activity), function(x) colMeans(x[, 3:68]))

    write.table(averages_all_interested_data, file ="Tidy Data Set with the Average.txt", row.name=FALSE ) 
