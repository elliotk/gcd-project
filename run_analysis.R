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
datasetDirectory <- "UCI\ HAR\ Dataset"

# Set path/to/dataset directory
datasetPath <- file.path(dataDirectory, datasetDirectory)

