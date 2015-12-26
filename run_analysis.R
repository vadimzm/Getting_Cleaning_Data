# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("reshape2")

# Loading the activity labels and data column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("UCI HAR Dataset/features.txt")[,2]

# Loading the test data and extracting only the measurements on the mean and standard deviation
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features
X_test <- X_test[, grepl("std\\(\\)|mean\\(\\)", features)]

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("id", "activity")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "subject"

# Binding the test data
test_data <- cbind(subject_test, y_test, X_test)

# Loading the train data and extracting only the measurements on the mean and standard deviation
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features
X_train <- X_train[, grepl("std\\(\\)|mean\\(\\)", features)]

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("id", "activity")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "subject"

# Binding the train data
train_data <- cbind(subject_train, y_train, X_train)

# Merging the test and train data
merge_data <- rbind(test_data, train_data)

# Melting the data
melt_data <- melt(merge_data, id = c("subject", "id", "activity"))

# Appling mean function to the dataset
tidy_data <- dcast(melt_data, subject + activity ~ variable, mean)

write.table(tidy_data, "tidy_data.txt", row.names = F)
