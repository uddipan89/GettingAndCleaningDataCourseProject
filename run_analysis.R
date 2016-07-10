# Project Work

# Code Name: run_analysis.R

# Steps:

# 1. Merge the training and the test sets to create one data set.

        # Read X data and bind
                X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
                X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
                
                X <- rbind(X_test, X_train)
                
        # Release Memory of X_test and X_train
                rm(X_test,X_train)
                
        # Read labels data and bind
                labels_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
                labels_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
                
                label <- rbind(labels_test, labels_train)
                
        # Release Memory of Y_test and Y_train
                rm(labels_test,labels_train)
        
        # Read subject data and bind
                subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
                subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
                
                subject <- rbind(subject_test, subject_train)
                
        # Release memory of subject_test and subject_train
                rm(subject_test,subject_train)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
                
        # The file "features.txt" contains the list of all features.
                
                features <- read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors=FALSE)
                
        # Logical Vector to keep only std and mean columns
                column_names <- grepl("(std|mean[^F])", features$V2, perl=TRUE)
        
        # Keep required data and name appropriately        
                X <- X[, column_names]
                names(X) <- features$V2[column_names]
                names(X) <- gsub("\\(|\\)", "", names(X))
                names(X) <- tolower(names(X))

# 3. Use descriptive activity names to name the activities in the data set

        # The file "activity_labels.txt" links the class labels with their activity name. We
        # use it to name the activities in the data set.
                
                activity <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
                sapply(activity,class) # returns V2 as factor
                activity[,2] = gsub("_", "", tolower(as.character(activity[,2])))

# 4. Appropriately label the data set with descriptive variable names.        
        
        # linking the activity names to the "label" table                
                label[,1] = activity[label[,1], 2]
                names(label) <- "activity"
                names(subject) <- "subject"

        # clean data 1
                
                cleanData1 <- cbind(subject, label, X)
                write.table(cleanData1,"cleanData1.txt")
                
# 5. Creates a second, independent tidy data set with the average of each variable for
# each activity and each subject. 
                
        # Lets call the second tidy data set as "cleanData2".
        # I will be using dplyr package for the problem
                
                cleanData2 <- tbl_df(cleanData1) %>%
                        group_by(subject, activity) %>% 
                                summarise_all(mean)

                write.table(cleanData2, "cleanData2.txt", row.name = FALSE)
                