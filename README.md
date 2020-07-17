---
title: "README"
#author: "Walter Theves"
#date: "17/07/2020"
#output:
 #html_document: default
  #pdf_document: default
---


### Getting and Cleaning Data - Course Project

This file has the purpose to explain on **how to run the analysis on the proposed Human Activity recognition dataset**. It does not have the intend to explain the ideas behind the study and methodology of how the data being analysed was obtained, but if you wish to know and read about it, a full description of it is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The dataset is available from the UCI Machine Learning Repository.
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### Files

`codebook.md` - **Code book** describing the different variables, their contents and operations being made with them in order to achieve the final tidy data.

`run_analysis.R` - **Full code** that downloads the data and then process the 5 steps required by the course's project. In the file itself there are observations and comments regarding the operations being made. A short explanation of the code is:
    
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names.
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`TidyData.txt` - Final set of the data, a.k.a. **tidy data**, after going through all the required steps of the project.
