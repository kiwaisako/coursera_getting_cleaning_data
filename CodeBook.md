Course Assignment Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data set description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:


* Merges the training and test sets to create one data set. It merges train and test sets for each of subject, x and y files, into subject_all, y_all and x_all. For subject_all, the number of instances = 10299, and the number of attributes = 1 (subject IDs). For y_all, the number of instances = 10299, and the number of attributes = 1 (activity IDs). For x_all, the number of instances = 10299, and the number of attributes = 561. 


* Appropriately labels the data set with descriptive names such as "subject" for the first column, "activity" for the second column, and the remaining variable names assigned from V2 column of features.txt.  
        
        
* Extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. 


* From activity_labels.txt, applies descriptive activity names to name the activities in the data set:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying


* Finally, creates a second, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as second_tidy_data.txt, a 180x81 data frame, where as before, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 81 attributes. 
