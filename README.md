# getandcleandata
Course project submission

> "alltrain" is resulting data frame from the tidied training set
> "alltest" is resulting data frame from the tidied test set
> "alldata" is the merged data set of the tidied training and test sets
> "summarydata" is the data frame with the mean and standard deviation of recorded instances
> "finalsumdata" is the data frame summarized and grouped by activity and subject

run_analysis is a function that:
>  reads the training set
> tidies training set (converts activity, subject into factors for analysis)
> reads the test set
> tidies test set (converts activity, subject into factors for analysis)
> merges the tidied training and test set
> then creates data frame with mean and standard deviation (grouped)

Data was used from:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
