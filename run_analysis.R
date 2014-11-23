# Elliot Kleiman
# run_analysis.R
# Wed Nov 19 17:45:32 EST 2014 

## 0. Download data ---------------------------

# Data dir exist?
if (!file.exists("data")) {
    dir.create("data")
}

# Set File Url
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Set data dir
data.directory <- "./data"

# Set data file name
file.name <- "dataset.zip"

# Set path/to/data file 
data.file <- file.path(data.directory, file.name)

# Download file
download.file(file.url, destfile = data.file, method = "curl")

# Record date downloaded
date.downloaded <- date()

# Extract zip archive file
unzip(dataFile, exdir = dataDirectory) 

## 1. Merge data ---------------------------

# Set dataset directory
dataset.directory <- file.path(data.directory, "UCI\ HAR\ Dataset")

# Set training data directory
training.directory <- file.path(dataset.directory, "train")

# Set training data files
training.file          <- file.path(training.directory, "X_train.txt")
training.subjects.file <- file.path(training.directory, "subject_train.txt")
training.labels.file   <- file.path(training.directory, "y_train.txt")

# Read training data
train.data <- read.table(training.file)
train.subj <- read.table(training.subjects.file)
train.labs <- read.table(training.labels.file)

# Merge training data
train.merge <- cbind(train.data, train.subj, train.labs)

# Set test data directory
test.directory <- file.path(dataset.directory, "test")

# Set test data files
test.file          <- file.path(test.directory, "X_test.txt")
test.subjects.file <- file.path(test.directory, "subject_test.txt")
test.labels.file   <- file.path(test.directory, "y_test.txt")

# Read test data
test.data <- read.table(test.file)
test.subj <- read.table(test.subjects.file)
test.labs <- read.table(test.labels.file)

# Merge test data
test.merge <- cbind(test.data, test.subj, test.labs)

# Merge training and test data
training.test <- rbind(train.merge, test.merge)

## 2. Extract mean and std measurements  ---------------------------

# Set features file
features.file <- file.path(dataset.directory, "features.txt")

# Read features file to get variable names
features <- read.table(features.file, stringsAsFactors = FALSE)

# Get mean indices
mean.features <- grep("mean\\(\\)", features$V2, value = FALSE)

# Get std indices
std.features <- grep("std\\(\\)", features$V2, value = FALSE)

# Extract columns for mean and std, and subject and activity
mean.std <- training.test[, c(mean.features, std.features, 562, 563)]

## 3. Use descriptive activity names to name the activities ---------------------------

# Set activity_labels file
activity.labels.file <- file.path(dataset.directory, "activity_labels.txt")

# Read activity_labels file
activity.labels <- read.table(activity.labels.file, stringsAsFactors = FALSE)

# Set activity column values to activity names from activity labels
mean.std[, 68] <- factor(mean.std[, 68], labels = activity.labels$V2)

## 4. Label data with descriptive variable names  ---------------------------

# Mean feature names:
# Remove parenthesis
mean.features.clean <- sub('\\(\\)', '', features$V2[mean.features], perl = TRUE)
# Replace - with .
mean.features.clean <- gsub('-', '.', mean.features.clean)

# Std feature names:
# Remove parenthesis
std.features.clean <- sub('\\(\\)', '', features$V2[std.features], perl = TRUE)
# Replace - with .
std.features.clean <- gsub('-', '.', std.features.clean)


                            
#aggdata <- aggregate(reduced.set, by = list(Activity = reduced.set$V1.2, Subject = reduced.set$V1.1), FUN = mean, na.rm = TRUE)
#summary(subset(aggdata, select = -c(V1.1, V1.2))) # or, summary(aggdata[-c(69, 70)])

aggdata.2 <- reduced.set %>%
               group_by(V1.2, V1.1) %>%
               summarise_each(funs(mean))

write.table(aggdata.2, row.names = FALSE, file = "./data/dplyr.result.txt")
