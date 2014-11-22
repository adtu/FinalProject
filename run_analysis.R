## This function performs the following tasks:
##   1. Merge the training and the test sets to create one data set
##   2. Appropriately label the data set with descriptive variable names
##   3. Use descriptive activity names to name the activities in the data set
##   4. Extract only the measurements on the mean and standard deviation for each measurement
##   5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

########################################################################################################################################
## 1. Merge the training and the test sets to create one data set
########################################################################################################################################

#### Read general datasets into R

#### This 6 x 2 data frame links the class labels with their activity names
activity_labels <- read.table("./data/activity_labels.txt")  

#### Assign meaningful names to columns in activity_labels data frame
names(activity_labels) <- c("label", "activity")   

#### This 561 X 2 data frame contains a list of all features (variables) and their associated id's. 
features <- read.table("./data/features.txt") 

#### Assign meaningful column names to features data frame
names(features) <- c("id", "feature")    

#######################################################################################################################################
#### Read training datasets into R

#### 7352 x 1 data frame used for training. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
subject_train <- read.table("./data/train/subject_train.txt") 

#### 7352 x 561 data frame used as training dataset
X_train <- read.table("./data/train/X_train.txt") 

#### 7352 x 1 data frame contains training labels
y_train <- read.table("./data/train/y_train.txt") 

###########################################################################################################################################
#### Read test datasets into R

#### 2947 x 1 data frame used for test. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
subject_test <- read.table("./data/test/subject_test.txt") 

#### 2947 x 561 data frame used as test dataset
X_test <- read.table("./data/test/X_test.txt") 

#### 2947 x 1 data frame contains test labels
y_test <- read.table("./data/test/y_test.txt") 

###########################################################################################################################################
#### Merge training and test datasets

#### Merge subject_train and subject_test data frames into a 10299 x 1 data frame
merged_subject <- rbind(subject_train, subject_test)

#### Merge X_train and X_test data frames into a 10299 x 561 data frame
merged_X <- rbind(X_train, X_test)

#### Merge y_train and y_test data frames into a 10299 x 1 data frame
merged_y <- rbind(y_train, y_test)

#### Assign meaningful column name to merged_subject data frame
names(merged_subject) <- "subject"

#### Assgin meaningful column name to merged_y data frame
names(merged_y) <- "activity_label" 

#######################################################################################################################################
## 2. Appropriately label the dataset with descriptive variable names. 
#######################################################################################################################################

names(merged_X) <- features$feature

#######################################################################################################################################
## 3. Use descriptive activity names to name the activities in the data set
#######################################################################################################################################

merged_y$activity <- activity_labels[merged_y$activity_label,2]

#######################################################################################################################################
## 4. Extract only the measurements on the mean and standard deviation for each measurement
#######################################################################################################################################

#### Extract ean and standard deviation for each measurement
idx <- grep("mean\\(\\)|std\\(\\)", names(merged_X))
extracted_X <- merged_X[,idx]

#### COlumn bind merged_subject, merged_y$activity, and extracted_X
mergedData <- cbind(merged_subject, activity = merged_y$activity, extracted_X)

#######################################################################################################################################
## From the data set created in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
#######################################################################################################################################

install.packages("reshape2")
library(reshape2)
mergedDataMelt <- melt(mergedData,id=c("subject","activity"),measure.vars=names(mergedData)[3:length(mergedData)])
finalData <- dcast(mergedDataMelt, subject + activity ~ variable, fun = mean)

