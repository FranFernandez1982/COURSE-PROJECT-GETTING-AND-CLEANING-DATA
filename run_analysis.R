
# -------------------------------------------------- Clean, load libraries and set de working directory -----------------------------------------------
rm(list=ls())
setwd("/home/fran/COURSERA/COURSE_03/WEEK_04/FINAL_PROJECT")
library(dplyr)

#--------------------------------------------------------------------- Load data ----------------------------------------------------------------------

Test <- read.table("./X_test.txt")
ActivityTest <- read.table("./y_test.txt")
SubjectTest <- read.table("./subject_test.txt")
Train <- read.table("./X_train.txt")
ActivityTrain <- read.table("./y_train.txt")
SubjectTrain <- read.table("./subject_train.txt")
Headers <- read.table("./features.txt")

#-------------------------------------------------------- Combine the data frame Test and Train -------------------------------------------------------

colnames(ActivityTest) <- "Activity"
colnames(ActivityTrain) <- "Activity"
Activity <- rbind(ActivityTest,ActivityTrain)
colnames(SubjectTest) <- "Subject"
colnames(SubjectTrain) <- "Subject"
Subject <- rbind(SubjectTest,SubjectTrain)
Headers <- select(Headers,-V1)
DataSet <- rbind(Test,Train)
colnames(DataSet) <- t(Headers)
DataSet <- cbind(Subject,Activity,DataSet)
rm(Headers, ActivityTest, ActivityTrain, Activity, Test, Train, Subject, SubjectTrain, SubjectTest)

#-------------------------------------------------- Extract only the Mean and the Standard Deviation --------------------------------------------------

TidyData <- DataSet[,c(1,2,grep("mean|std",names(DataSet)))]
TidyData$Activity <- replace(TidyData$Activity,grep(1,TidyData$Activity),"WALKING")
TidyData$Activity <- replace(TidyData$Activity,grep(2,TidyData$Activity),"WALKING_UPSTAIRS")
TidyData$Activity <- replace(TidyData$Activity,grep(3,TidyData$Activity),"WALKING_DOWNSTAIRS")
TidyData$Activity <- replace(TidyData$Activity,grep(4,TidyData$Activity),"SITTING")
TidyData$Activity <- replace(TidyData$Activity,grep(5,TidyData$Activity),"STANDING")
TidyData$Activity <- replace(TidyData$Activity,grep(6,TidyData$Activity),"LAYING")

#---------------------------------------------------- Compute the mean of Tidy Data ------------------------------------------------------------------- 

TidyData2 <- group_by(TidyData, Subject, Activity)
TidyData2 <- summarise_all(TidyData2,"mean")
write.table(TidyData2, "TidyData.txt",row.names = FALSE)

