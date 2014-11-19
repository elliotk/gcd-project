# Elliot Kleiman
# run_analysis.R
# Wed Nov 19 17:45:32 EST 2014 

# Data dir exist?
if (!file.exists("data")) {
    dir.create("data")
}

# Set File Url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download file
download.file(fileUrl, destfile = "./data/dataset.zip", method = "curl")

# Record data downloaded
dateDownloaded <- date()

# Extract zip archive file
unzip("./data/dataset.zip", exdir = "./data") 


