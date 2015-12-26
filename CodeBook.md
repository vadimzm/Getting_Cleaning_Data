# Code Book

This code book describes the data set and the transformations or work that you performed to clean up the data.


## The data set

The data set includes some text files with measurements and additional files for reference:

- 'train/X_train.txt': The training set.

- 'train/y_train.txt': The training labels.

- 'train/subject_train.txt': The subjects who measured the activities.

- 'test/X_test.txt': The test set.

- 'test/y_test.txt': The test labels.

- 'test/subject_test.txt': The subjects who measured the activities.

- 'features_info.txt': The features infomation.

- 'features.txt': The feature list.

- 'activity_labels.txt': The activity label list.

All other files in the data set are not relevant for the project.


## Transformations

There are the following steps:

1. Load the train and test data and extract only the measurements on the mean and standard deviation for each measurement.
2. Use activity names to name the activities in the data set.
3. Merge the training and the test sets.
4. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

