# Elliot Kleiman
# run_analysis.R
# Wed Nov 19 17:45:32 EST 2014 

# 0. Download data ---------------------------

# Data dir exist?
if (!file.exists("data")) {
    dir.create("data")
}

# Set File Url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Set data dir
dataDirectory <- "./data"

# Set data file name
fileName <- "dataset.zip"

# Set path/to/data file 
dataFile <- file.path(dataDirectory, fileName)

# Download file
download.file(fileUrl, destfile = dataFile, method = "curl")

# Record date downloaded
dateDownloaded <- date()

# Extract zip archive file
unzip(dataFile, exdir = dataDirectory) 

# 1. Merge data ---------------------------

# Set dataset directory
datasetDirectory <- file.path(dataDirectory, "UCI\ HAR\ Dataset")

# Set training dataset directory
trainingDirectory <- file.path(datasetDirectory, "train")

# Set training dataset files
trainingFile         <- file.path(trainingDirectory, "X_train.txt")
trainingSubjectsFile <- file.path(trainingDirectory, "subject_train.txt")
trainingLabelsFile   <- file.path(trainingDirectory, "y_train.txt")

# Read training set
train.set  <- read.table(trainingFile)
train.subj <- read.table(trainingSubjectsFile)
train.labs <- read.table(trainingLabelsFile)

# Merge training set
train.merge <- cbind(train.set, train.subj, train.labs)

# Set test dataset directory
testDirectory <- file.path(datasetDirectory, "test")

# Set test dataset files
testFile         <- file.path(testDirectory, "X_test.txt")
testSubjectsFile <- file.path(testDirectory, "subject_test.txt")
testLabelsFile   <- file.path(testDirectory, "y_test.txt")

# Read test set
test.set  <- read.table(testFile)
test.subj <- read.table(testSubjectsFile)
test.labs <- read.table(testLabelsFile)

# Merge test set
test.merge <- cbind(test.set, test.subj, test.labs)

# Merge training and test sets to create one complete data set
complete.set <- rbind(train.merge, test.merge)

# 2. Extract mean and std measurements  ---------------------------

# Set features file
featuresFile <- file.path(datasetDirectory, "features.txt")

# Read features file
features <- read.table(featuresFile, stringsAsFactors = FALSE)

# Get mean indices
mean.features <- grep("mean\\(\\)", features$V2, value = FALSE)

# Get std indices
std.features <- grep("std\\(\\)", features$V2, value = FALSE)

# Extract only measurements on mean and std, and keep the last two columns
# of subject and activity
reduced.set <- complete.set[, c(mean.features, std.features, 562, 563)]

# 3. Use descriptive activity names to name the activities ---------------------------

# Set activity_labels file
activityLabelsFile <- file.path(datasetDirectory, "activity_labels.txt")

# Read activity_lablels file
activity.labels <- read.table(activityLabelsFile, stringsAsFactors = FALSE)

# Set activity names from activity labels to activity column
reduced.set[, 68] <- factor(reduced.set[, 68], labels = activity.labels$V2)
