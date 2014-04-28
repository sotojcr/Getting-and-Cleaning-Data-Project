## Course Project
runAnalysis <- function(){
## read data        
# read data
                   X_train <- read.table("./train/X_train.txt")
                   X_test  <- read.table("./test/X_test.txt")
                   
# read id's
                   subject_train <- read.table("./train/subject_train.txt")
                   subject_test  <- read.table("./test/subject_test.txt")

# read activity names
                   feature       <- read.table("features.txt")

## Merge the training and the test sets to create one data set.
                  X_merged <- rbind(X_train, X_test)

## Use descriptive activity names to name the activities in the data set
## Appropriately label the data set with descriptive activity names                   
                  ColumnNames          <- feature$V2
                  colnames(X_merged) <- ColumnNames

## Extract only the measurements on the mean and standard deviation for each measurement.  
                  Keep_Columns         <- grepl(".*std().*|.*mean().*", colnames(X_merged))
                  X_SubSet             <- X_merged[,Keep_Columns]

## merging subject IDs with the data frame
subjectList <- rbind(subject_train,subject_test)
X_with_Subject <- cbind(subjectList,X_SubSet)
colnames(X_with_Subject)[1] <- "Subject_id"

## Creating a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
X_id   <- split(X_with_Subject,X_with_Subject$Subject_id)
X_avg  <- sapply(X_id, function(x) colMeans(x, na.rm=TRUE))
X_avg2  <- as.data.frame(t(X_avg))
#Transpose the data
write.table(X_avg2, "tidyData.txt", sep=",", row.names=FALSE)
X_avg2
}

