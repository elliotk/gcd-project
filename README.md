gcd-project
===========

Getting and Cleaning Data Course Project Assignment

``` text
Author: Elliot Kleiman
File..: README.md
Date..: Sun Nov 23 12:53:12 EST 2014
Desc..: This file explains the project files and their layout
```
##### Purpose:

The purpose of this project is to clean data to produce a tidy data set.
The course project data comes from the [Human Activity Recognition Using 
Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset provided by the Center for Machine Learning and Intelligent Systems at UC Irvine.

##### Usage:

To run the analysis and generate tidy data, do one of the following:

Execute from a Unix or Linux shell
``` Shell
$ Rscript run_analysis.R
```
Note:
All commands starting with a '$' sign need to be executed from a Unix or Linux shell

-or-

Execute from R console
``` R
source(run_analysis.R)
```
##### Results:

The output of running `run_analysis.R` is file `tidy.txt`, which is the tidy data set sought for the project.
File `tidy.txt` is located in `data/tidy.txt`.

##### Files:

To produce a tidy data set for this project assignment, the following files were created:
- CodeBook.Rmd - A convenience script to render listing of variables in tidy data set in markdown format
- CodeBook.md - Textual description of variable (or, feature) names in tidy data set file `tidy.txt`
- README.md - Overview description of project and files involved in producing tidy data
- run_analysis.R - R script to produce tidy data
- tidy.txt - Tidy data set
- mean.features.clean.rda - Binary format of character vector of descriptive mean feature names, used in `CodeBook.Rmd`
- std.features.clean.rda - Binary format of character vector of descriptive std feature names, used in `CodeBook.Rmd`
- mean.std.features.rda - Binary format of character vector of both descriptive mean and std feature names, used in `CodeBook.Rmd`
- dataset.zip - Course project data set file downloaded from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

From the unzipped course project data set file, the following files were manipulated: 
- `data/UCI\ HAR\ Dataset/activity_labels.txt` - File containing activity names, used to name activity name values as text
- `data/UCI\ HAR\ Dataset/features.txt` - File containing raw feature (or, variable) names. Edited these to produce more descriptive names for tidy data set file `tidy.txt`
- training data
  - `data/UCI\ HAR\ Dataset/train/X_train.txt` - Numeric measurements of features from train data
  - `data/UCI\ HAR\ Dataset/train/subject_train.txt` - Subject values from train data
  - `data/UCI\ HAR\ Dataset/train/y_train.txt` - Activity values from train data
  - Merged files `X_train.txt`, `subject_train.txt`, `y_train.txt` into one training data set
- test data
  - `data/UCI\ HAR\ Dataset/test/X_test.txt` - Numeric measurements of features from test data
  - `data/UCI\ HAR\ Dataset/test/subject_test.txt` - Subject values from test data
  - `data/UCI\ HAR\ Dataset/test/y_test.txt` - Activity values from test data
  -  Merged files `X_test.txt`, `subject_test.txt`, `y_test.txt` into one test data set
- Merged training and test data sets into one data set

See `run_analysis.R` for more details on implementation of file manipulation and processing.

##### File layout:

``` Shell
bash-4.3$ tree
.
|-- CodeBook.Rmd
|-- CodeBook.md
|-- README.md
|-- data
|   |-- UCI\ HAR\ Dataset
|   |   |-- README.txt
|   |   |-- activity_labels.txt
|   |   |-- features.txt
|   |   |-- features_info.txt
|   |   |-- test
|   |   |   |-- Inertial\ Signals
|   |   |   |   |-- body_acc_x_test.txt
|   |   |   |   |-- body_acc_y_test.txt
|   |   |   |   |-- body_acc_z_test.txt
|   |   |   |   |-- body_gyro_x_test.txt
|   |   |   |   |-- body_gyro_y_test.txt
|   |   |   |   |-- body_gyro_z_test.txt
|   |   |   |   |-- total_acc_x_test.txt
|   |   |   |   |-- total_acc_y_test.txt
|   |   |   |   `-- total_acc_z_test.txt
|   |   |   |-- X_test.txt
|   |   |   |-- subject_test.txt
|   |   |   `-- y_test.txt
|   |   `-- train
|   |       |-- Inertial\ Signals
|   |       |   |-- body_acc_x_train.txt
|   |       |   |-- body_acc_y_train.txt
|   |       |   |-- body_acc_z_train.txt
|   |       |   |-- body_gyro_x_train.txt
|   |       |   |-- body_gyro_y_train.txt
|   |       |   |-- body_gyro_z_train.txt
|   |       |   |-- total_acc_x_train.txt
|   |       |   |-- total_acc_y_train.txt
|   |       |   `-- total_acc_z_train.txt
|   |       |-- X_train.txt
|   |       |-- subject_train.txt
|   |       `-- y_train.txt
|   |-- dataset.zip
|   |-- mean.features.clean.rda
|   |-- mean.std.features.rda
|   |-- std.features.clean.rda
|   `-- tidy.txt
`-- run_analysis.R
```
##### R session info

``` R
> sessionInfo()
R version 3.0.3 (2014-03-06)
Platform: x86_64-unknown-linux-gnu (64-bit)

locale:
 [1] LC_CTYPE=en_US       LC_NUMERIC=C         LC_TIME=en_US       
 [4] LC_COLLATE=C         LC_MONETARY=en_US    LC_MESSAGES=en_US   
 [7] LC_PAPER=en_US       LC_NAME=C            LC_ADDRESS=C        
[10] LC_TELEPHONE=C       LC_MEASUREMENT=en_US LC_IDENTIFICATION=C 

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] knitr_1.7 dplyr_0.2

loaded via a namespace (and not attached):
[1] Rcpp_0.11.3    assertthat_0.1 compiler_3.0.3 evaluate_0.5.5 formatR_1.0   
[6] magrittr_1.0.1 parallel_3.0.3 stringr_0.6.2  tools_3.0.3
```

