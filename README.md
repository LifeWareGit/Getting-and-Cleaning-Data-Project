## Getting and Cleaning Data
### Course Project
---
**run_analysis.R**
**Version 1.0**
**Compiled with R version 3.2.2**
---
#### Description
The following paragraphs briefly describe the requirements for executing the run_analysis.R script. The purpose of "run_analysis.R" is to load the raw unprocessed data files associated with the "Human Activity Recognition Using Smartphones" experiment and transform the data into tidy data. Specifically, "run_analysis.R" extracts the mean and standard deviations of the features contained across all of the various files produced by the Human Activity experiment and from that create a tidy data set.  The resulting tidy data set is a single file that correlates the "subject" (e.g. the volunteer), and the specific activity (i.e. Walking, Laying, Standing, etc...) with the observed features (e.g. sensor signals - accelerometer and gyroscope measurements). 

In accordance with the class project requirements, run_analysis.R performs the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Execution Requirements
run_analysis.R has the following dependencies:
1. Package "dplyr"
2. Package "data.table"
3. The "UCI HAR Dataset.zip" downloaded and unzipped in the current working directory.  The file can be downloaded at the following URL:
[UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Execution Steps
Perform the following steps to successfully execute the run_analysis.R script:
1. Download the "UCI HAR Dataset.zip" file into the current working directory
2. Download the "run_analysis.R" script into the current working directory
3. Load the "data.table" library: library(data.table)
4. Load the "dplyr" library: library(dplyr) 
5. Source the "run_analysis.R" script: source("./run_analysis.R")

#### Output
The "run_analysis.R" script produces two tidy files in the current working directory:
1. analysis_data.txt - tidy data set which in a single file that correlates the subject, activity, and sensor measurements.
2. analysis_summary.txt - independent tidy data set with the average of each variable for each subject and for each of the six measured activities (e.g. Walking, Standing, Laying, etc...)