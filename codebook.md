# Codebook

### Getting and Cleaning Data - Course Project Codebook

This is the codebook of the `run_analysis.R` file, containing information regarding the functions being run on the .R file, the variables, units and summaries being calculated, and some other relevant information needed to get a full understanding of the file.

### Code hierarchy and organization

The code was developed and split in 7 major functions in order to achieve the final set of the data, aka *tidy data*.

The names of the variables and what they do are listed in the **variables** part, with this one being exclusive to the functions and the operations being made by them, which are:

`downloadFile()` - downloads the data and unzipps it in the desired folder.

`readingData()` - reads the six different .txt files of data into variables.

`mergingData()` - merges the previous read data into one big data frame, and also names the columns identifying them.

`extractMeasurements()` - extracts only the measurements on the mean and standard deviation for each measurement and stores it in a new data frame.

`descriptiveNames()` - give descriptive activity names to name the activities in the data set, because they were initially identified as a set of integers.

`labelingData()` - appropriately labels the data of the data set, so their contents can become comprehensible by a person with no inside knowledge of the code.

`independentTidyData()` - creates the final data set with the average of each variable for each activity and each subject, aka the **tidy data**.


### Variables

    fileURL - contains the address of the dataset which will be downloaded.
    path - contains the file.path of the directory used to store the data.
        The variables initiating in "data" contain the different sets of data of the downloaded .zip file
    dataSubjectTest - variable holding the subject_test.txt data
    dataSubjectTrain - variable holding the subject_train.txt data
    dataLabelTest - variable holding the y_test.txt data
    dataLabelTrain - variable holding the y_train.txt data
    dataSetTest - variable holding the X_test.txt data
    dataSetTrain - variable holding the X_train.txt data
        The three following variables initiating in "data" contain the six previous "data" variables, merged in order to arrive the full data set.
    dataSubject - variable holding dataSubjectTest and dataSubjectTrain
    dataLabel - variable holding dataLabelTrain and dataLabelTest
    dataSet - variable holding dataSetTrain and dataSetTest
    Featuresnames - variable holding the names of features.txt file
    data_aux - auxiliar variable holding partially merged data and later helping on filtering data
    Fulldata - variable holding the full data frame
    data - variable holding the measurements on the mean and standard deviation for each measurement
    activityLabels - variable holding the names of activity_labels.txt, which are alter attributed to the column activity label of the data set
    TidyData - final set of the data, aka tidy data