CodeBook
===========

File to explain project feature (or, variable) names and data processing steps

```Shell
Author: Elliot Kleiman
File..: CodeBook.Rmd
Desc..: File to explain work involved in cleaning up feature names
Date..: Sat Nov 22 20:54:55 EST 2014
```



##### Feature abbreviation key:
```Shell
t       = Time
f       = Frequency, obtained by Fast Fourier Transform
X       = X dimensional axis
Y       = Y dimensional axis
Z       = Z dimensional axis
Acc     = Acceleration
Mag     = Magnitude
std     = Standard deviation
Body    = Human body of subject
Gyro    = Gyroscope
Jerk    = Jerk signal
mean    = Mean value
Gravity = Gravity acceleration
```

##### Feature names and their descriptions:


```
##             feature.name
## 1        tBodyAcc.mean.X
## 2        tBodyAcc.mean.Y
## 3        tBodyAcc.mean.Z
## 4     tGravityAcc.mean.X
## 5     tGravityAcc.mean.Y
## 6     tGravityAcc.mean.Z
## 7    tBodyAccJerk.mean.X
## 8    tBodyAccJerk.mean.Y
## 9    tBodyAccJerk.mean.Z
## 10      tBodyGyro.mean.X
## 11      tBodyGyro.mean.Y
## 12      tBodyGyro.mean.Z
## 13  tBodyGyroJerk.mean.X
## 14  tBodyGyroJerk.mean.Y
## 15  tBodyGyroJerk.mean.Z
## 16      tBodyAccMag.mean
## 17   tGravityAccMag.mean
## 18  tBodyAccJerkMag.mean
## 19     tBodyGyroMag.mean
## 20 tBodyGyroJerkMag.mean
## 21       fBodyAcc.mean.X
## 22       fBodyAcc.mean.Y
## 23       fBodyAcc.mean.Z
## 24   fBodyAccJerk.mean.X
## 25   fBodyAccJerk.mean.Y
## 26   fBodyAccJerk.mean.Z
## 27      fBodyGyro.mean.X
## 28      fBodyGyro.mean.Y
## 29      fBodyGyro.mean.Z
## 30      fBodyAccMag.mean
## 31  fBodyAccJerkMag.mean
## 32     fBodyGyroMag.mean
## 33 fBodyGyroJerkMag.mean
## 34        tBodyAcc.std.X
## 35        tBodyAcc.std.Y
## 36        tBodyAcc.std.Z
## 37     tGravityAcc.std.X
## 38     tGravityAcc.std.Y
## 39     tGravityAcc.std.Z
## 40    tBodyAccJerk.std.X
## 41    tBodyAccJerk.std.Y
## 42    tBodyAccJerk.std.Z
## 43       tBodyGyro.std.X
## 44       tBodyGyro.std.Y
## 45       tBodyGyro.std.Z
## 46   tBodyGyroJerk.std.X
## 47   tBodyGyroJerk.std.Y
## 48   tBodyGyroJerk.std.Z
## 49       tBodyAccMag.std
## 50    tGravityAccMag.std
## 51   tBodyAccJerkMag.std
## 52      tBodyGyroMag.std
## 53  tBodyGyroJerkMag.std
## 54        fBodyAcc.std.X
## 55        fBodyAcc.std.Y
## 56        fBodyAcc.std.Z
## 57    fBodyAccJerk.std.X
## 58    fBodyAccJerk.std.Y
## 59    fBodyAccJerk.std.Z
## 60       fBodyGyro.std.X
## 61       fBodyGyro.std.Y
## 62       fBodyGyro.std.Z
## 63       fBodyAccMag.std
## 64   fBodyAccJerkMag.std
## 65      fBodyGyroMag.std
## 66  fBodyGyroJerkMag.std
## 67               subject
## 68              activity
##                                                               feature.description
## 1                             mean of body linear acceleration measured on X-axis
## 2                             mean of body linear acceleration measured on Y-axis
## 3                             mean of body linear acceleration measured on Z-axis
## 4                                 mean of gravity acceleration measured on X-axis
## 5                                 mean of gravity acceleration measured on Y-axis
## 6                                 mean of gravity acceleration measured on Z-axis
## 7            mean of body linear acceleration with jerk signal measured on X-axis
## 8            mean of body linear acceleration with jerk signal measured on Y-axis
## 9            mean of body linear acceleration with jerk signal measured on Z-axis
## 10                                      mean of body gyroscope measured on X-axis
## 11                                      mean of body gyroscope measured on Y-axis
## 12                                      mean of body gyroscope measured on Z-axis
## 13                     mean of body gyroscope with jerk signal measured on X-axis
## 14                     mean of body gyroscope with jerk signal measured on Y-axis
## 15                     mean of body gyroscope with jerk signal measured on Z-axis
## 16                                     mean of body linear acceleration magnitude
## 17                                         mean of gravity acceleration magnitude
## 18                           mean of body linear acceleration with jerk magnitude
## 19                                               mean of body gyroscope magnitude
## 20                              mean of body gyroscope with jerk signal magnitude
## 21                  mean of frequency body linear acceleration measured on X-axis
## 22                  mean of frequency body linear acceleration measured on Y-axis
## 23                  mean of frequency body linear acceleration measured on Z-axis
## 24 mean of frequency body linear acceleration with jerk signal measured on X-axis
## 25 mean of frequency body linear acceleration with jerk signal measured on Y-axis
## 26 mean of frequency body linear acceleration with jerk signal measured on Z-axis
## 27                            mean of frequency body gyroscope measured on X-axis
## 28                            mean of frequency body gyroscope measured on Y-axis
## 29                            mean of frequency body gyroscope measured on Z-axis
## 30                           mean of frequency body linear acceleration magnitude
## 31          mean of frequency body linear acceleration with jerk signal magnitude
## 32                                     mean of frequency body gyroscope magnitude
## 33                    mean of frequency body gyroscope with jerk signal magnitude
## 34                             std of body linear acceleration measured on X-axis
## 35                             std of body linear acceleration measured on Y-axis
## 36                             std of body linear acceleration measured on Z-axis
## 37                                 std of gravity acceleration measured on X-axis
## 38                                 std of gravity acceleration measured on Y-axis
## 39                                 std of gravity acceleration measured on Z-axis
## 40            std of body linear acceleration with jerk signal measured on X-axis
## 41            std of body linear acceleration with jerk signal measured on Y-axis
## 42            std of body linear acceleration with jerk signal measured on Z-axis
## 43                                       std of body gyroscope measured on X-axis
## 44                                       std of body gyroscope measured on Y-axis
## 45                                       std of body gyroscope measured on Z-axis
## 46                      std of body gyroscope with jerk signal measured on X-axis
## 47                      std of body gyroscope with jerk signal measured on Y-axis
## 48                      std of body gyroscope with jerk signal measured on Z-axis
## 49                                      std of body linear acceleration magnitude
## 50                                          std of gravity acceleration magnitude
## 51                            std of body linear acceleration with jerk magnitude
## 52                                                std of body gyroscope magnitude
## 53                               std of body gyroscope with jerk signal magnitude
## 54                   std of frequency body linear acceleration measured on X-axis
## 55                   std of frequency body linear acceleration measured on Y-axis
## 56                   std of frequency body linear acceleration measured on Z-axis
## 57  std of frequency body linear acceleration with jerk signal measured on X-axis
## 58  std of frequency body linear acceleration with jerk signal measured on Y-axis
## 59  std of frequency body linear acceleration with jerk signal measured on Z-axis
## 60                             std of frequency body gyroscope measured on X-axis
## 61                             std of frequency body gyroscope measured on Y-axis
## 62                             std of frequency body gyroscope measured on Z-axis
## 63                            std of frequency body linear acceleration magnitude
## 64           std of frequency body linear acceleration with jerk signal magnitude
## 65                                      std of frequency body gyroscope magnitude
## 66                     std of frequency body gyroscope with jerk signal magnitude
## 67                                                                        subject
## 68                                                                       activity
```

##### Feature (or, variable) name transformations

