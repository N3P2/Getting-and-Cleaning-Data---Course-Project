# Checking if R studio contains the following packages
if (!require("plyr")) {
        install.packages("plyr")
}

library(plyr)

# Downloading data sets
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "C:/Users/Qingyuan/Documents/R/UCI HAR data.zip") 
unzip("UCI HAR data.zip")

# Checking to see if the following working directory has been set to the folder containing the files
getwd()
list.files()
setwd("C:/Users/Qingyuan/Documents/R/UCI HAR Dataset") # to replace the directory with your own document folder

# Step 1: Reading all data files in training and test sets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Step 2: Combining training and test data into respective data sets (x data set, y data set, subject data set)
var_x <- rbind(x_train, x_test) # create 'x' data set
var_y <- rbind(y_train, y_test) # create 'y' data set
var_sub <- rbind(subject_train, subject_test) # create 'subject' data set

# Step 3: Extracting the measurements on the mean and std deviation for each measurement
feature_label <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", feature_label[, 2]) # get only columns with mean() or std() in their names
var_x <- var_x[, mean_and_std_features] # subset the desired columns
names(var_x) <- feature_label[mean_and_std_features, 2] # correct the column names
head(var_x) # run if you need to view the data

# Step 4: Activity labels tagged to name the activities in the data set
activity_label <- read.table("activity_labels.txt")
var_y[, 1] <- activity_label[var_y[, 1], 2] # update values with correct activity names
names(var_y) <- "activity" # correct column name
head(var_y) # run if you need to view the data

# Step 5: Assigning appropriate labels to the data set with descriptive variable names
names(var_sub) <- "subject"
var_all <- cbind(var_x, var_y, var_sub) # bind all the data in a single data set
head(var_all) # run if you need to view the data

# Step 6: Creating a second, independent tidy data set with the mean of each variable for each activity and each subject
mean_data <- ddply(var_all, .(subject, activity), function(x) colMeans(x[, 1:66])) # 66 <- 68 columns are not numeric (activity & subject) so they have to excluded from the ddply
write.table(mean_data, "mean_data.txt", row.name=FALSE)

# Step 7: Reading the final file data
read.file("mean_data.txt") 
