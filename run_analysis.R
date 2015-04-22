#   #####################################################################################
#   ############################### run_analysis.R ######################################
#   #####################################################################################

    library("dplyr")

    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="./dataset.zip", mode="wb") 
    unzip("./dataset.zip",exdir = ".")

#   It can takes up to 3 minutes depeding on your internet conection, and computer specification.
#   The directory "UCI HAR Dataset" is created with all the files and subfolders "test and train"

#   Loading data
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    features <- read.table("./UCI HAR Dataset/features.txt")
    
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#   Combining subject, features for test and train subsets
    data_test <- cbind(subject_test,y_test,x_test)
    data_train <- cbind(subject_train,y_train,x_train)

#   Combining test and train data to a global dataset
    dataset <- rbind(data_train,data_test) 

#   Cleaning the non-alfanumeric characters, and using CamelCase structure
    clearfeatures <- gsub("\\(|)|,|-|_","",features[,2])
    clearfeatures <- gsub("^t","Time",clearfeatures)
    clearfeatures <- gsub("^f","Frequency",clearfeatures)
    clearfeatures <- gsub("angle", "Angle",clearfeatures)
    clearfeatures <- gsub("Meangravity","MeanGravity",clearfeatures)
    clearfeatures <- gsub("mean","Mean",clearfeatures)
    clearfeatures <- gsub("std","Std",clearfeatures)
    activity_labels <- gsub("_","",activity_labels[,2] %>% tolower)

#   Naming the variables
    colnames(dataset) <- c("subject","activity",clearfeatures)

#   There are duplicated column names as you can verify in the original file "features.txt".
#   Use length(unique(features[,2])) to verify that it is less than 561 
#   Using the following commands from:
#   http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name
#   it creates and extension '.1', '.2', etc... for each repeat name
    valid_column_names <- make.names(names=names(dataset), unique=TRUE, allow_ = TRUE)

#   Cleaning the non-alphanumeric characters, changing "." by "x" 
    names(dataset) <- gsub("\\.","x",valid_column_names)

#   Extracting the all variables that have "mean" and "std" from dataset and
#   assigning to a object tidyData
    tidyData <- select(dataset,subject,activity,contains("mean",ignore.case=TRUE),contains("std",ignore.case=TRUE))

#   Verify if there is any "NA". If there is it can use na.rm = TRUE in mean()
    sum(is.na(tidyData))

#   Creating a second, independent tidy data set with the average of each variable (total of 86)
#   for each activity (total of 6) and each subject(total of 30).
#   Note, subject and activity are numeric variables when they are averaged return to the same value.
#   For instance, if there are n activity type 5, the average is 5*n/n = 5.

#   Function data_mean calculates the mean of an activity of a subject
    data_mean <- function(data_set,subjId,actId){
        data_set %>% filter(subject==subjId,activity==actId)%>% sapply(mean)}

    NewTidyData <- NULL
    for (i in 1:30){ 
        for (j in 1:6) {
            NewTidyData <-rbind(NewTidyData,data_mean(tidyData,i,j))}}

#   Converting the matrix to a data.frame
    NewTidyData <- as.data.frame(NewTidyData)

#   Using descriptive activity names (activity_labels) to name the activities in the data set
    for (i in 1:6) {
        NewTidyData[,2] = gsub(i,activity_labels[i],NewTidyData[,2])}                           

#   Creating the "NewTidyData.txt" in the working directory
    write.table(NewTidyData,file = "./NewTidyData.txt",row.name=FALSE,sep="\t",quote=FALSE)

#   Creating the "variable.txt" in the working directory. This is used to built code book
    write.table(names(NewTidyData),file="./variables.txt",row.name=FALSE,col.name=FALSE,quote=FALSE)
