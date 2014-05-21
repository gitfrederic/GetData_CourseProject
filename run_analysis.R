
### Setup working directory with archive file contents.
## Check if one file exists (quick failsafe), if not then re-extract entire archive.
if (!file.exists("UCI HAR Dataset/train/X_train.txt")) {
    if (file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
        unlink("UCI HAR Dataset")
        message("Extracting 'getdata-projectfiles-UCI HAR Dataset.zip' into current working directory.")
        unzip("getdata-projectfiles-UCI HAR Dataset.zip")
    }
    else {
        warning("File 'getdata-projectfiles-UCI HAR Dataset.zip' expected in current working directory, but not found.")
    }
}



### Merge the training and the test sets to create one data set.

## -- Read features
features <- read.table("UCI HAR Dataset/features.txt", comment.char = c(""), colClasses=c("numeric", "character"), col.names = c("featurenum", "featurename"))

## -- Check for duplicate feature names (there are 84)
# sum(duplicated(features$featurename))

## -- Clean feature names
features$featurename <- tolower(gsub(")", "", gsub("(", "", gsub(",", "", gsub("-", "", features$featurename, fixed=TRUE), fixed=TRUE), fixed=TRUE), fixed=TRUE))
features$featurename <- gsub("acc", "acceleration", features$featurename)

## -- Notice that some featueres names are duplicated, but same number as input (84)
# sum(duplicated(features$featurename))


## -- Read train set
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char = c(""), colClasses=c("numeric"))

## -- Read test set
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char = c(""), colClasses=c("numeric"))

## -- Read subject train
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttrain$subject <- relevel(subjecttrain$subject, 1)

## -- Read subject test
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttest$subject <- relevel(subjecttest$subject, 1)

## -- Read train labels
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", comment.char = c(""), colClasses=c("integer"), col.names = c("activity_id"))

## -- Read test labels
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", comment.char = c(""), colClasses=c("integer"), col.names = c("activity_id"))

## -- Read activity names
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt", comment.char = c(""), colClasses=c("integer", "factor"), col.names = c("activity_id", "activity"))
activity_names$activity <- relevel(activity_names$activity, "WALKING")

## -- Merge activity names with train/test labels and drop id column in each (need to workaround merge limitation)
ytrain$rownum <- seq_len(nrow(ytrain))
ytrain <- merge(ytrain, activity_names, by.x="activity_id", by.y="activity_id")
ytrain <- ytrain[order(ytrain$rownum),]
ytrain$activity_id <- NULL
ytrain$rownum <- NULL
ytest$rownum <- seq_len(nrow(ytest))
ytest <- merge(ytest, activity_names, by.x="activity_id", by.y="activity_id")
ytest <- ytest[order(ytest$rownum),]
ytest$activity_id <- NULL
ytest$rownum <- NULL

## -- Assemble a data frame with all information
dataset <- cbind(rbind(xtrain, xtest), rbind(subjecttrain, subjecttest), rbind(ytrain, ytest))
names(dataset) <- c(features$featurename, "subject", "activity")
dataset$subject <- relevel(dataset$subject, 1)
dataset$activity <- relevel(dataset$activity, "WALKING")


## Check (TODO: REMOVE)
epsilon <- 1e-5
stopifnot(abs(mean(dataset[dataset$subject==1 & dataset$activity=="WALKING",]$tbodyaccelerationmeanx) - 0.2773308) <= epsilon)
stopifnot(abs(mean(dataset[dataset$subject==1 & dataset$activity=="WALKING",]$fbodyaccelerationmeanx) - (-0.2027943)) <= epsilon)
stopifnot(abs(mean(dataset[dataset$subject==25 & dataset$activity=="WALKING_UPSTAIRS",]$fbodyaccelerationstdy) - (-0.1999884)) <= epsilon)
stopifnot(abs(mean(dataset[dataset$subject==25 & dataset$activity=="WALKING",]$fbodyaccelerationstdy) - (-0.1703138)) <= epsilon)
stopifnot(abs(mean(dataset[dataset$subject==25 & dataset$activity=="WALKING",]$fbodyaccelerationmeany) - (-0.2518803)) <= epsilon)



## Extracts only the measurements on the mean and standard deviation for each measurement.
## -- According to the features_info.txt file, the measurements with both mean and standard deviation are:
## --   tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, 
## --   tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ,
## --   fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
## We therefore expect the following number of measurements:
## -- 6 for each of: tBodyAcc-XYZ, tGravityAcc-XY, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ,
## --    fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ
## -- 2 for each of: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
## --    fBodyAccMag, fBodyBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
##
## This gives a total of: (6 x 8) + (2 x 9) = 66 measurements
##
## NOTE: The feature documentation says 'fBodyAccJerkMag', but the feature name is interpreted as 'fBodyBodyAccJerkMag' (etc.) instead.

meansd_dataset <- dataset[,c("tbodyaccelerationmeanx", "tbodyaccelerationstdx", 
                             "tbodyaccelerationmeany", "tbodyaccelerationstdy", 
                             "tbodyaccelerationmeanz", "tbodyaccelerationstdz",
                             "tgravityaccelerationmeanx", "tgravityaccelerationstdx",
                             "tgravityaccelerationmeany", "tgravityaccelerationstdy",
                             "tgravityaccelerationmeanz", "tgravityaccelerationstdz",
                             "tbodyaccelerationjerkmeanx", "tbodyaccelerationjerkstdx",
                             "tbodyaccelerationjerkmeany", "tbodyaccelerationjerkstdy",
                             "tbodyaccelerationjerkmeanz", "tbodyaccelerationjerkstdz",
                             "tbodygyromeanx", "tbodygyrostdx",
                             "tbodygyromeany", "tbodygyrostdy",
                             "tbodygyromeanz", "tbodygyrostdz",
                             "tbodygyrojerkmeanx", "tbodygyrojerkstdx",
                             "tbodygyrojerkmeany", "tbodygyrojerkstdy",
                             "tbodygyrojerkmeanz", "tbodygyrojerkstdz",
                             "tbodyaccelerationmagmean", "tbodyaccelerationmagstd",
                             "tgravityaccelerationmagmean", "tgravityaccelerationmagstd",
                             "tbodyaccelerationjerkmagmean","tbodyaccelerationjerkmagstd",
                             "tbodygyromagmean", "tbodygyromagstd",
                             "tbodygyrojerkmagmean","tbodygyrojerkmagstd",
                             "fbodyaccelerationmeanx", "fbodyaccelerationstdx",
                             "fbodyaccelerationmeany", "fbodyaccelerationstdy",
                             "fbodyaccelerationmeanz", "fbodyaccelerationstdz",
                             "fbodyaccelerationjerkmeanx", "fbodyaccelerationjerkstdx",
                             "fbodyaccelerationjerkmeany", "fbodyaccelerationjerkstdy",
                             "fbodyaccelerationjerkmeanz", "fbodyaccelerationjerkstdz",
                             "fbodygyromeanx", "fbodygyrostdx",
                             "fbodygyromeany", "fbodygyrostdy",
                             "fbodygyromeanz", "fbodygyrostdz",
                             "fbodyaccelerationmagmean", "fbodyaccelerationmagstd",
                             "fbodybodyaccelerationjerkmagmean", "fbodybodyaccelerationjerkmagstd",
                             "fbodybodygyromagmean", "fbodybodygyromagstd",
                             "fbodybodygyrojerkmagmean", "fbodybodygyrojerkmagstd",
                             "subject", "activity"
                             )]

    
## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
## -- e.g.:
## -- Subject    Activity     Var1    Var2... VarX
## -- 1                1       mean   mean... mean
## --- Give the means with the same number of decimal places that the input data uses.

## Except for 'subject' and 'activity' prefix variables with 'meanof'
tidy_dataset <- meansd_dataset
for (nameId in seq_along(colnames(tidy_dataset))) {
    if (colnames(tidy_dataset)[nameId] != "subject" && colnames(tidy_dataset)[nameId] != "activity") {
        colnames(tidy_dataset)[nameId] <- paste("meanof", colnames(tidy_dataset)[nameId], sep="")
    }
}

measure_var_vec <- c()
for (nameId in seq_along(colnames(meansd_dataset))) {
    if (colnames(meansd_dataset)[nameId] != "subject" && colnames(meansd_dataset)[nameId] != "activity") {
        measure_var_vec <- append(measure_var_vec, colnames(meansd_dataset)[nameId])
    }
}

library(reshape2)
meltdf <- melt(meansd_dataset, id=c("subject", "activity"), measure.vars=measure_var_vec)

tidy_dataset <- dcast(meltdf, subject + activity ~ ..., mean)

for (nameId in seq_along(colnames(tidy_dataset))) {
    if (colnames(tidy_dataset)[nameId] != "subject" && colnames(tidy_dataset)[nameId] != "activity") {
        
        # Prefix 'meanof' to the variable names.
        colnames(tidy_dataset)[nameId] <- paste("meanof", colnames(tidy_dataset)[nameId], sep="")
        
        # Use same precision as input for mean values.
        tidy_dataset[,nameId] <- format(tidy_dataset[,nameId], scientific=TRUE)
    }
}

tidy_dataset <- tidy_dataset[order(tidy_dataset$subject, tidy_dataset$activity),]


## Check (TODO: REMOVE)
epsilon <- 1e-5
stopifnot(abs(tidy_dataset[tidy_dataset$subject==1 & tidy_dataset$activity=="WALKING",]$meanoftbodyaccelerationmeanx - 0.2773308) <= epsilon)
stopifnot(abs(tidy_dataset[tidy_dataset$subject==1 & tidy_dataset$activity=="WALKING",]$meanoffbodyaccelerationmeanx - (-0.2027943)) <= epsilon)
stopifnot(abs(tidy_dataset[tidy_dataset$subject==25 & tidy_dataset$activity=="WALKING_UPSTAIRS",]$meanoffbodyaccelerationstdy - (-0.1999884)) <= epsilon)
stopifnot(abs(tidy_dataset[tidy_dataset$subject==25 & tidy_dataset$activity=="WALKING",]$meanoffbodyaccelerationstdy - (-0.1703138)) <= epsilon)
stopifnot(abs(tidy_dataset[tidy_dataset$subject==25 & tidy_dataset$activity=="WALKING",]$meanoffbodyaccelerationmeany - (-0.2518803)) <= epsilon)


## Tidy Data:
## 1. Each variable should be in one column.
## 2. Each observation should in in one row.
## 3. One table per "kind" of variable.
## 4. Multiple tables should be linked by an one (or more) column(s).

## Output of Tidy Data:
## 1. Include a header with variable names.
## 2. Make variable names human readable.
## 3. One file per table.

## --- USE 'write.table'
write.table(tidy_dataset, "tidy_dataset.txt", quote=FALSE, sep="\t")
