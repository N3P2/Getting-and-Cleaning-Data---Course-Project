# Getting-and-Cleaning-Data---Course-Project

Introduction

This repo contains the completed tasks for the course project for "Getting and Cleaning Data" for Coursera MOOC Data Science specialization.

Raw Data

The dataset being used is: Human Activity Recognition Using Smartphones

The zipped file consists of 2 main folders (broken down into one folder with 3 files) and 4 description files.  
There are a total of 561 variables listed in the features.txt.
There are a total of 6 variables listed in activity labels.

Analysis

run_analysis.R will merge the test and training sets together. All operations are done on R v3.1.2

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.
About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
