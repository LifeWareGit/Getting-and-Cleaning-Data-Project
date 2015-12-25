# Load the features names.  This code assumes that the features in this dataset
# are in the same order as the observations captured in the x_train and x_test
# data files.
features_dt <- fread("./UCI HAR Dataset/features.txt")

# Load the activity names to id map
activityNames_dt <- fread("./UCI HAR Dataset/activity_labels.txt")

# Load the activity being observed for each row
y_train_dt <- fread("./UCI HAR Dataset/train/y_train.txt")

# Load the values of all the features for each activity which corresponds
# row-by-row to the activities just loaded
x_train_dt <- fread("./UCI HAR Dataset/train/X_train.txt")

# Load the subject observed for each row
subj_train_dt <- fread("./UCI HAR Dataset/train/subject_train.txt")

# rename the default column names in the data table to that of the
# previously loaded feature names
names(x_train_dt) <- features_dt[[2]]

# Extract only the features that are a mean or standard deviation
x_train_dt <- select(x_train_dt,grep('?mean\\(\\)?|?std\\(\\)?',colnames(x_train_dt)))

# By row there is a one-to-one correspondance between subject, activity, and features.
# The following line chains together the subject and activity tables with the features
# on a row-by-row basis
train_combined <- mutate(x_train_dt, activity = select(y_train_dt,V1)) %>% 
     mutate(subject = select(subj_train_dt,V1)) %>%
     mutate(activity = activityNames_dt[activity,V2])

# Execute the exact same steps performed on the training data now on the testing data
x_test_dt <- fread("./UCI HAR Dataset/test/X_test.txt")
y_test_dt <- fread("./UCI HAR Dataset/test/y_test.txt")
subj_test_dt <- fread("./UCI HAR Dataset/test/subject_test.txt")
names(x_test_dt) <- features_dt[[2]]
x_test_dt <- select(x_test_dt,grep('?mean\\(\\)?|?std\\(\\)?',colnames(x_test_dt)))

# As before, combined the subject, activities, and features within a single data table
test_combined <- mutate(x_test_dt,activity=select(y_test_dt,V1)) %>%
     mutate(subject = select(subj_test_dt,V1)) %>%
     mutate(activity = activityNames_dt[activity,V2])

# Append the test and training data tables and sort it by first by
# subject and then by activity
combined_sorted <- rbind_list(test_combined,train_combined) %>%
     arrange(subject,activity)

# The following lines rearrange the columns so that the subject and activity 
# features are display first for readibility. 
numCols <- ncol(combined_sorted)
combined_sorted <- combined_sorted[c(numCols,(numCols-1),1:(numCols-2))]

# Write the resulting "Tidy" data table file
write.table(combined_sorted,"Analysis_Data.txt",row.names=FALSE)

# Perform a summary mean analysis on every feature foreach subject for every activity
summary_dt <- group_by(combined_sorted,subject,activity) %>% summarize_each(funs(mean))

# Write the summary results to a file
write.table(summary_dt,"Analysis_Summary.txt",row.names=FALSE)

