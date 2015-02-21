## step 1  - Read all the data sources into R 
 test.labels     <- read.table( "test/y_test.txt",         col.names="label"   ) 
 test.subjects   <- read.table( "test/subject_test.txt",   col.names="subject" ) 
 test.data       <- read.table( "test/X_test.txt"                              )  
 train.labels    <- read.table( "train/y_train.txt",       col.names="label"   ) 
 train.subjects  <- read.table( "train/subject_train.txt", col.names="subject" ) 
 train.data      <- read.table( "train/X_train.txt"                            ) 
 
 #         - Combine the 6 datasets with the format of -> subjects, labels, the rest 
 alldata <- rbind( cbind( test.subjects, test.labels, test.data ), cbind( train.subjects, train.labels, train.data ) ) 

 ## step 2 - Read the features data into R
 features <- read.table( "features.txt", strip.white=TRUE, stringsAsFactors=FALSE ) 
 #         - Keep the features of mean and standard deviation only 
 features.mean.std <- features[ grep( "mean\\(\\)|std\\(\\)", features$V2 ), ] 
 
 #         - Subset only the means and standard deviations from features, in increments of 2 (due to having subjects and labels at the start) 
 data.mean.std <- alldata[ , c( 1, 2, features.mean.std$V1+2 ) ] 
 
 ## step 3 - Read the activity labels into R 
 labels <- read.table( "activity_labels.txt", stringsAsFactors=FALSE ) 
 #         - Replace activity labels from the data with label names 
 data.mean.std$label <- labels[ data.mean.std$label, 2 ] 
 
 ## step 4 - Create a list of the current column & feature names 
 good.colnames <- c( "subject", "label", features.mean.std$V2 ) 
 #         - Tidy the list by removing all non-alphabetic characters & convert all to lowercase 
 good.colnames <- tolower( gsub( "[^[:alpha:]]", "", good.colnames ) ) 
 #         - Substitute column names with list for proper column headings 
 colnames( data.mean.std ) <- good.colnames 
 
 ## step 5 - Find the mean for each combination, sectioned by subject & label 
 aggr.data <- aggregate( data.mean.std[ , 3:ncol( data.mean.std ) ], 
                        by = list( subject = data.mean.std$subject,  
                        label = data.mean.std$label ), mean ) 

 ## Step 6 - Write the data to text file (For course upload)
 write.table( format( aggr.data, scientific=T), "tidydata.txt", row.names=F, col.names=F, quote=2 )