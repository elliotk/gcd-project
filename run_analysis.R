# Elliot Kleiman
# run_analysis.R
# Wed Nov 19 17:45:32 EST 2014 

# Download data ---------------------------

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

# Merge data ---------------------------

# Set dataset dir
datasetDirectory <- file.path(dataDirectory, "UCI\ HAR\ Dataset")

# Set training dataset dir
trainingDirectory <- file.path(datasetDirectory, "train")

# Set training dataset files
trainingSet <- file.path(trainingDirectory, "X_train.txt")
trainingSubjects <- file.path(trainingDirectory, "subject_train.txt")
trainingLabels <- file.path(trainingDirectory, "y_train.txt")

# Read training set
train.set <- read.table(trainingSet)
train.subj <- read.table(trainingSubjects)
train.labs <- read.table(trainingLabels)

# Merge training set
train.merge <- cbind(train.set, train.subj, train.labs)

# Set test dataset dir
testDirectory <- file.path(datasetDirectory, "test")

# Set test dataset files
testSet <- file.path(testDirectory, "X_test.txt")
testSubjects <- file.path(testDirectory, "subject_test.txt")
testLabels <- file.path(testDirectory, "y_test.txt")

# Read test set
test.set <- read.table(testSet)
test.subj <- read.table(testSubjects)
test.labs <- read.table(testLabels)

# Merge test set
test.merge <- cbind(test.set, test.subj, test.labs)

# Merge training and test sets to create one complete data set
complete.set <- rbind(train.merge, test.merge)
