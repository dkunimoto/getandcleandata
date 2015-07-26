run_analysis <- function(){
    library(dplyr)
    
    #reading training set
    training <- read.table("UCI HAR Dataset/train/X_train.txt")
    trainingsub <- read.table("UCI HAR Dataset/train/subject_train.txt")
    trainingact <- read.table("UCI HAR Dataset/train/y_train.txt")
    # tidying training set
    trainingsub <- rename(trainingsub, subject = V1)
    trainingact <- rename(trainingact, activity = V1)
    alltrain <- cbind(trainingsub, trainingact, training)
    alltrain$subject <- as.factor(alltrain$subject)
    alltrain$activity <- as.factor(alltrain$activity)
    levels(alltrain$activity)[1] <- "WALKING"
    levels(alltrain$activity)[2] <- "WALKING_UP"
    levels(alltrain$activity)[3] <- "WALKING_DOWN"
    levels(alltrain$activity)[4] <- "SITTING"
    levels(alltrain$activity)[5] <- "STANDING"
    levels(alltrain$activity)[6] <- "LAYING"
    
    # reading test set
    test <- read.table("UCI HAR Dataset/test/X_test.txt") 
    testsub <- read.table("UCI HAR Dataset/test/subject_test.txt")
    testact <- read.table("UCI HAR Dataset/test/y_test.txt") 
    # tidying test set
    testsub <- rename(testsub, subject = V1)
    testact <- rename(testact, activity = V1)
    alltest <- cbind(testsub, testact, test)
    alltest$subject <- as.factor(alltest$subject)
    alltest$activity <- as.factor(alltest$activity)
    levels(alltest$activity)[1] <- "WALKING"
    levels(alltest$activity)[2] <- "WALKING_UP"
    levels(alltest$activity)[3] <- "WALKING_DOWN"
    levels(alltest$activity)[4] <- "SITTING"
    levels(alltest$activity)[5] <- "STANDING"
    levels(alltest$activity)[6] <- "LAYING"
    
    # merge the tidied training and test set
    alldata <- rbind(alltrain, alltest)
    groupdata <- group_by(alldata, activity, subject)
    
    # creating data frame with mean and standard deviation
    meandata <- apply(groupdata[ ,3:563], 1, mean)
    sddata <- apply(groupdata[ ,3:563], 1, sd)
    summarydata <- cbind(select(groupdata, subject:activity), meandata, sddata)
    summarydata <- group_by(summarydata, activity, subject)
    finalsumdata <- summarize(summarydata, meandata = mean(meandata), sddata = mean(sddata))
    
    # write.table(finalsumdata, "mydata.txt", sep="\t", row.names = FALSE)
}
