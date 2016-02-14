## Assignment - Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 

# 1. Merges the training and the test sets to create one data set.

features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")

x_train <- read.table("./train/X_train.txt")
x_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

subject_all <- rbind(subject_train, subject_test)
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)

# 4. Appropriately labels the data set with descriptive variable names. 
names(subject_all) <- c("subject")
names(x_all) <- features$V2
names(y_all) <- c("activity")

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
x_all  <- x_all[,grepl("mean|std", names(x_all))]

# 3. Uses descriptive activity names to name the activities in the data set.
data_all <- cbind(subject_all, y_all, x_all)
data_all$activity <- factor(data_all$activity, activity_labels[[1]], activity_labels[[2]])

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
second_tidy_data <- aggregate(data_all, by=list(data_all$subject, data_all$activity), FUN=mean)
second_tidy_data <- subset(second_tidy_data, select = -c(3,4))
colnames(second_tidy_data)[1] <- "subject"
colnames(second_tidy_data)[2] <- "activity"
library(plyr)
second_tidy_data <- arrange(second_tidy_data, subject, activity)
write.table(second_tidy_data, "second_tidy_data.txt")
