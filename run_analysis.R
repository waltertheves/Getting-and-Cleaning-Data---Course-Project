##
## First step - downloading the file and reading the data
downloadFile <- function() {
    # - Function to download the file at the current directory
    # - Unzipps the .zip
    # - Lists the files contained at the unzipped folder
    
    setwd("C:/Users/Teste/Desktop/Projects/CourseProject_GettingCleaningData")
    fileUrl <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
    download.file(fileUrl, file.path("./", "data.zip"))
    unzip("./data.zip")
    path <- file.path("./", "UCI HAR Dataset")
    list.files(path)#, recursive=TRUE)
}
readingData <- function() {
    # - There are 2 folders, train and test, each with 3 files to be read. 6 in total.
    # - The 6 tables are: 2 for Activity(Set), 2 for Subjects and 2 for Labels.
    
    library(data.table)
        # Reading the Subject files
    dataSubjectTest <- read.table(file.path(path, "test", "subject_test.txt"))
    dataSubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"))
        # Reading the Labels(y) files
    dataLabelTest <- read.table(file.path(path, "test", "y_test.txt"))
    dataLabelTrain <- read.table(file.path(path, "train", "y_train.txt"))
        # Reading the Test and Training Sets
    dataSetTest <- read.table(file.path(path, "test", "X_test.txt"))
    dataSetTrain <- read.table(file.path(path, "train", "X_train.txt"))
}

## 1 - Merge the training and the test sets to create one large data set.
mergingData <- function() {
    # - The data will be merged first by its type. Subject with subject, label
    # with label and set with set.
    # - Later it will be put all together in a large data frame and names will
    # be attributed to the columns
    
    dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
    dataLabel <- rbind(dataLabelTrain, dataLabelTest)
    dataSet <- rbind(dataSetTrain, dataSetTest)
    names(dataSubject) <- "subject"
    names(dataLabel) <- "activity label"
    Featuresnames <- read.table(file.path(path, "features.txt"))
    names(dataSet) <- Featuresnames$V2
    
    data_aux <- cbind(dataSubject, dataSet)
    Fulldata <- cbind(data_aux, dataLabel) # full data.frame
}

## 2 - Extract only the measurements on the mean and standard deviation for
## each measurement.
extractMeasurements <- function() {
    data_aux <- grep("mean\\(\\)|std\\(\\)", Featuresnames$V2, value=TRUE)
    #data_aux <- grep("mean|std", Featuresnames$V2, value=TRUE)
    data <- subset(Fulldata, select = c("subject", data_aux, "activity label"))
}

## 3 - Use descriptive activity names to name the activities in the data set.
descriptiveNames <- function() {
    # The names of the activities will be loaded to an archive, and then the
    # activity label column of the data will be transformed into a factor, with
    # the levels being the contents of activityLabels
    activityLabels <- read.table(file.path(path, "activity_labels.txt"))
    data$`activity label` <- as.factor(data$`activity label`)
    levels(data$`activity label`) <- activityLabels$V2
}

## 4 - Appropriately labels the data set with descriptive variable names.
labelingData <- function() {
    names(data) <- gsub("^t", "time", names(data))
    names(data) <- gsub("^f", "frequency", names(data))
    names(data) <- gsub("Acc", "Accelerometer", names(data))
    names(data) <- gsub("Mag", "Magnitude", names(data))
    names(data) <- gsub("Gyro", "Gyroscope", names(data))
    names(data) <- gsub("BodyBody", "Body", names(data))
}

## 5 - From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
independentTidyData <- function() {
    #install.packages("plyr")
    #library(plyr)
    TidyData <- aggregate(. ~subject + `activity label`, data, mean)
    write.table(TidyData, "./tidydata.txt", row.names = TRUE)
}
View(TidyData)
