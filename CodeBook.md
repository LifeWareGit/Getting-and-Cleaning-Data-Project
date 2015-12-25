## Getting and Cleaning Data
### Course Project: Code Book
---
#### High-Level Summary
This Code Book briefly describes both the contents (e.g. variables) and transformation steps that were taken for producing the "analysis_summary.txt" tidy data set.  This data set will be used for subsequent analysis activities in future courses.  The "raw" unprocessed input data was obtained from the "Human Activity Recognition Using Smartphones" research performed by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory and can be downloaded at the following link:

[UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Study Design
##### Original Research and Data Collection
The "raw" data set that was used as input for this initial analysis consisted of a collection of data files.  According to the original documentation associated with the raw data, the data was collected by observing 30 volunteers within an age range of 19-48 years. Each person observed performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on their waist. Using the phone's embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity measurements were captured at a constant rate of 50Hz and from their a total of 561 different features/variables were produced for each observation. Although the original experiment produced 561 distinct variables/features across the six activities for each of the 30 subjects, for the purposes of this analysis, only the standard deviation and mean feature values were extracted and subsequently processed.

The following original data files where used as input for creating the tidy data set:

- **features.txt** - contains the label names (1 per row) of all 561 variables captured

- **activity_labels.txt** - provides an id to activity mapping of all 6 activities (e.g. 1=walking, 5-standing, etc...)

- **y_train.txt** - For each observation of the 561 variables contained in the x_train.txt file, provides the integer id of the associated activity. Each row of this file corresponds directly to the same row in the x_train.txt data file. 

- **x_train.txt** - contains the values associated with all of the 561 variables for each observation.  In other words, each row in this text file contains all 561 variable values representing a single observation associated with a particular activity and a particular subject.

- **subject_train.txt** For each observation of the 561 variables contained in the x_train.txt file, this file provides the integer id of the associated subject being observed. Each row of this file corresponds directly to the same row in the x_train.txt data file. 

The following three files are related in the same way as their corresponding "test" counterparts
- **y_test.txt**
- **x_test.txt**
- **subject_test.txt**

##### Data Transformation Steps
In order to produce a single tidy data set, the raw data files associated with the "train" and "test" data files were initially processed separately and then later combined to produce a final single tidy data set.  For each of the test/train group of raw input files, the variables contained in the x_train/test data sets where renamed in accordance with the "features.txt" file described above. It was assumed that each row of the features.txt file corresponded directly to each column of the x_train.txt and x_test.txt data sets.  Additionally, the activity and subject ids found in the y_test/train.txt files and subject_test/train.txt files described previously were added as additional columns/variables creating a single data set containing the original 561 observations along with their corresponding subject and activity. For readability, the activity ids were replaced using the label data found in the activity_labels.txt file as highlighted previously. For each of the test/train input files, only the standard deviation and mean variables where selected out for further processing.

A single tidy data set was then created by combining the transformed test/train input files just described.  This single data set was subsequently sorted based on subject and activity respectively.  Finally, a single summary tidy data set was produced which contains the average of all of the final variables selected (e.g. only the standard deviation and mean variables) for each subject, for each of the six different activities.

#### Code Book
The following section briefly describes the variables found in the analysis_summary.txt tidy data set.

| Variable | Units | Description |
| -------- |:-----:| -----------:|
| subject  | 1-30  |	Id representing 1 of 30 test subjects |
|activity|	Label| One of six activities being tested: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|

In accordance with the course project instructions, the following variables found in the analysis_summary.txt tidy data set represent the average of the mean and standard deviation variables extracted out of the original unprocessed raw files. Each row/observation of the summary data set correlates the subject/person under test to one of the six activities previously mentioned for a total of 180 observations. Every variable name ending in "-XYZ" represents a set of three variables of measurement taken along the X, Y, and Z axis respectively:

- tBodyAcc-mean()-XYZ
- tBodyAcc-std()-XYZ
- tGravityAcc-mean()-XYZ
- tGravityAcc-std()-XYZ
- tBodyAccJerk-mean()-XYZ
- tBodyAccJerk-std()-XYZ
- tBodyGyro-mean()-XYZ
- tBodyGyro-std()-XYZ
- tBodyGyroJerk-mean()-XYZ
- tBodyGyroJerk-std()-XYZ
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-XYZ
- fBodyAcc-std()-XYZ
- fBodyAccJerk-mean()-XYZ
- fBodyAccJerk-std()-XYZ
- fBodyGyro-mean()-XYZ
- fBodyGyro-std()-XYZ
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()