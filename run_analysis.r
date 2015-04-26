#1. Merges the training and the test sets to create one data set.

# load relevant .txt files from UCI HAR Dataset
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

# assign column names for training and test sets
names(X_train)<-features$V2
names(X_test) <-features$V2

# assign a column for subjects
names(subject_train) <- "subject"
names(subject_test) <- "subject"

# assign activity labels for labels files
names(y_train) <- "activity"
names(y_test) <- "activity"

# merge/bind train sets
train <- cbind(subject_train, y_train, X_train)
# merge/bind test sets
test <- cbind(subject_test, y_test, X_test)

# MERGE TRAIN AND TEST SET TO ONE DATA FRAME
data <- rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#find columns that have relevant mean and std in them with wildcards
MeanStdCol <- grep(".*mean.*|.*std.*", names(data), ignore.case=TRUE)

#need to keep subject and activity columns
columns.needed <- c(MeanStdCol, 562, 563)

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITING", "STANDING", "LAYING")

#4. Appropriately labels the data set with descriptive variable names. 
data$activity <- factor(data$activity, labels=activity_labels)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#load reshape2 package
library(reshape2)

# melt data, distinguishing id variable and activity variable
melt.data <- melt(data, id=c("subject","activity"))

#use dcast to reshape to data to a nice, tidy dataset!
tidy <- dcast(melt.data, subject+activity ~ variable, mean)

#write as a .txt file for submission
write.table(tidy, "tidy.csv", row.names=FALSE)