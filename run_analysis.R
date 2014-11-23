#!/usr/bin/env Rscript

# Author: Elliot Kleiman
# File..: run_analysis.R
# Desc..: File to analyze course project data
# Date..: Sat Nov 22 20:54:55 EST 2014
# Usage.: $ Rscript run_analysis.R # execute from a Unix or Linux shell, or
#         source(run_analysis.R)   # execute from R console 


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
unzip(data.file, exdir = data.directory) 

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

## 2. Extract mean and std measurements ---------------------------

# Set features file
features.file <- file.path(dataset.directory, "features.txt")

# Read features file to get variable names
features <- read.table(features.file, stringsAsFactors = FALSE)

# Get mean indices
mean.features <- grep("mean\\(\\)", features$V2, value = FALSE)
# Save object for use in CodeBook.rmd
save(mean.features, file = file.path(data.directory,"mean.features.rda"))

# Get std indices
std.features <- grep("std\\(\\)", features$V2, value = FALSE)
# Save object for use in CodeBook.rmd
save(std.features, file = file.path(data.directory, "std.features.rda"))

# Extract columns for mean and std, and subject and activity
mean.std <- training.test[, c(mean.features, std.features, 562, 563)]

## 3. Use descriptive activity names to name the activities ---------------------------

# Set activity_labels file
activity.labels.file <- file.path(dataset.directory, "activity_labels.txt")

# Read activity_labels file
activity.labels <- read.table(activity.labels.file, stringsAsFactors = FALSE)

# Set activity column values to activity names from activity labels
mean.std[, 68] <- factor(mean.std[, 68], labels = activity.labels$V2)

## 4. Label data with descriptive variable names ---------------------------

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

# Assign descriptive feature names to data frame
colnames(mean.std) <- c(mean.features.clean, std.features.clean, "subject", "activity")
# Save object for use in CodeBook.rmd
mean.std.features <- colnames(mean.std)
save(mean.std.features, file = file.path(data.directory, "mean.std.features.rda"))

## 5. Create tidy data set ---------------------------

# Load dplyr package
require(dplyr)

# Group by activity and subject
# For each activity-subject combination, compute mean for each variable
tidy <- mean.std %>%
            group_by(activity, subject) %>%
            summarise_each(funs(mean))

# Write tidy data to file
write.table(tidy, row.names = FALSE, file = "./data/tidy.txt")
