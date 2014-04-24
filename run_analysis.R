run_analysis <- function(dir = "UCI HAR Dataset") {
    # Reads necessary files from train folder
    x = read.table(paste(dir, "train//X_train.txt", sep="//"))
    y = read.table(paste(dir, "train//y_train.txt", sep="//"))
    s = read.table(paste(dir, "train//subject_train.txt", sep="//"))
    f = read.table(paste(dir, "features.txt", sep="//"))
    
    # Reads the features to select which columns to keep
    mt = grepl("mean\\(\\)|std\\(\\)", f[, 2], fixed=FALSE)
    train <- data.frame(subject = s, activity = y, x[, mt])
    
    # Reads necessary files from test folder
    x = read.table(paste(dir, "test//X_test.txt", sep="//"))
    y = read.table(paste(dir, "test//y_test.txt", sep="//"))
    s = read.table(paste(dir, "test//subject_test.txt", sep="//"))
    test <- data.frame(subject = s, activity = y, x[, mt])   
    
    # Combine the datasets
    all <- rbind(train, test)
    
    # Assignes the activity labels text to the data in activity column
    a <- read.table("UCI HAR Dataset//activity_labels.txt")
    for (i in 1:6) {all[, 2] <- sub(a[i, 1], a[i, 2], all[, 2])}
    
    # Sets subject and activity as factors
    all[, 2] <- as.factor(all[, 2])
    all[, 1] <- as.factor(all[, 1])
    
    # Labels the column names from the features file
    colnames(all)[3:68] <- as.character(f[mt, 2])
    colnames(all)[1:2] <- c("subject", "activity")
    
    # Reshape the data and apply the mean fuction
    temp = melt(all, id=c("subject","activity"))
    temp2 = dcast(temp, subject + activity ~ variable, mean)
    print(dim(temp2))
    # Output the tidy data set to file output.txt
    write.table(x=temp2, "output.txt", row.names=FALSE)
}