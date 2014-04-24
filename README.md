Readme for cleaning data peer assignment

There is one file (run_analysis.r) to produce tidy data from the raw data. The assignment says that the Samsung data is in your working directory. The script takes one agurment, dir, which is used to specify the location of the data if it is not in your working directory. The script takes the raw data set and combines the train and test cases into one data set. The variables of interest are only those that have both a mean and standard deviation, which results in 33 variables for each. The variables are grouped by subject number and activity. The activity data have been changed from a number to descriptive text. The output is a file, output.txt, that contains the mean of each variable grouped by each subject/activity combination and is of size 180x68.

The file CodeBook.md explains the variables and transformation to the tidy data.
