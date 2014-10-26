Getting and Cleaning Data: Course Project


This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", 


Raw data


 Ther are 2 folders test and training data which are exactly simialr in structure.

The features (561 of them) are unlabeled and can be found in the x_test.txt/x_train.txt.
 The activity labels are in the y_test.txt/y_train.txt file. 
The test subjects are in the subject_test.txt/subject_test.txt file.


Data set details

I created a script called run_analysis.R which will merge the test and training sets together. 

Prerequisites

    the UCI HAR Dataset must be extracted.unzipped the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

After merging testing and training by column and row binding, labels are added and only columns that have to do with mean and standard deviation are kept.

The script creates tidy data having means ofr the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.
About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.