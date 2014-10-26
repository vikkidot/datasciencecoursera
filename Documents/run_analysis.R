## Step 1 Merges the training and the test sets to create one data set.

## Read test sets 
test_x = read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(test_x) -- 2947  561
test_y = read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(test_y) -- 2947    1
test_subject = read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(test_subject) --  2947    1

## Merging test data files into one file
test_all <- cbind(test_x,test_y,test_subject)


## Read training sets 
train_x = read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(train_x) [1] 7352  561
train_y = read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(train_y) [1] 7352  1
train_subject = read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE, header =FALSE); 
##dim(train_x) [1] 7352  561

## Read activity_labels
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE, header =FALSE); 


## Read features
features = read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE, header =FALSE); 

## Merging train data files into one file
train_all <- cbind(train_x,train_y,train_subject)


## Merge the test and training datasets 

finaldata <- rbind(test_all,train_all)


##STEP 2 -     Extracts only the measurements on the mean and standard deviation for each measurement. 


## get only the wanted columns from features
index <- grep(".*mean.*|.*std.*",features[,2])
features <- features[index,]
## add train_y,train_subject
index <- c(index,562,563)

## Get selected columns
finaldata <- finaldata[,index]



## STEP 3 Uses descriptive activity names to name the activities in the data set
## STEP 4 Appropriately labels the data set with descriptive variable names. 

colnames(finaldata) <- c(features$V2,"Activity","Subject")
##dim(finaldata)

i <-  1 
for(act in  activity_labels$V2)
{
        ##print(i)
        ##print(act)
        ## print(activity_labels$V2)
        finaldata$Activity <- gsub(i,act,finaldata$Activity)
        i <-  i + 1
}

finaldata$Activity <- as.factor(finaldata$Activity)
finaldata$Subject <-  as.factor(finaldata$Subject)



##Step5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy <- aggregate(finaldata,by=list(activity = finaldata$Activity,subject = finaldata$Subject),mean)

write.table(tidy, "tidy.txt", sep=",", row.name=FALSE)


