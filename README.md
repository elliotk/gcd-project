gcd-project
===========

Getting and Cleaning Data Course Project Assignment

``` text
Author: Elliot Kleiman
File..: README.md
Date..: Sun Nov 23 12:53:12 EST 2014
Desc..: This file explains the project files and their layout
```

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


