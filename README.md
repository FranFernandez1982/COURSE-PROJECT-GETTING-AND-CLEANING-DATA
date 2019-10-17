
The file "run_analysis.R" converts several input files like X_test.txt, y_test.txt,
subject_test.txt, subject_train.txt, X_train.txt, y_train.txt and features.txt in a 
tidy dataset in different steps

-	The first step deals with set the working directory and load the dplyr library

-	Along the second step, the scipt load the files previously dowloaded manually and
	assign a variable to everyone like Test, ActivityTest, SubjectTest, son on...

- The third step is related with set the variable names and also to include the
	columns 'Subject' and 'Activity'. Moreover, the Train and the Test datasets are 
	merged

- The obtention of the complete table of Tidy Data is get by selecting only 
	the columns Subject, Activity and all columns with the words mean and std. In these 
	step the activities were renamed to be readable in the dataset.

- Finally another tidy data was obtained by groping Subject and Activity and
	computing the mean for every variables

 

