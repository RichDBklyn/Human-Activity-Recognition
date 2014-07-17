#read raw training and test data into separate data frames
TrainDF<-read.table("X_train.txt")
TestDF<-read.table("X_test.txt")
#combine training and test data into a single data frame
CombinedDF<-rbind(TrainDF,TestDF)
#assign names from original data source to each variable in data frame
VarLabels<-read.table("features.txt")
names(CombinedDF)<-VarLabels$V2
#create variable with subject IDs for each record and add to combined data frame
SubjTrain<-read.table("subject_train.txt")
SubjTest<-read.table("subject_test.txt")
SubjCombined<-rbind(SubjTrain,SubjTest)
CombinedDF<-cbind(CombinedDF,SubjCombined)
colnames(CombinedDF)[562]<-"SubjID"
#create variable with activity code for each record and add to combined data frame 
ActivityTrain<-read.table("y_train.txt")
ActivityTest<-read.table("y_test.txt")
ActivityCombined<-rbind(ActivityTrain,ActivityTest)
CombinedDF<-cbind(CombinedDF,ActivityCombined)
colnames(CombinedDF)[563]<-"Activity"
#creates list of names for variables measuring mean or standard deviation
#also include subject ID and activity variables
VarNamesSubsetMean<-grep("mean",names(CombinedDF),fixed=TRUE,value=TRUE)
VarNamesSubsetMean<-grep("meanFreq",VarNamesSubsetMean,fixed=TRUE,value=TRUE,invert=TRUE)
VarNamesSubsetSD<-grep("std",names(CombinedDF),fixed=TRUE,value=TRUE)
VarNamesSubset<-c("SubjID","Activity",VarNamesSubsetMean,VarNamesSubsetSD)
#creates smaller data frame using selected variables
SubsetDF<-CombinedDF[VarNamesSubset]
#convert Activity variable to a factor
FactorLevels<-c(1,2,3,4,5,6)
FactorLabels<-c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
SubsetDF$Activity<-factor(SubsetDF$Activity,levels=FactorLevels,labels=FactorLabels)
#edit variable names to standard format
#first four letters are function (ex. "Mean")
#after underscore, next letter indicates domain [time=t, frequency=f]
#next set of letters reprsent measure
#finally, an _X,_Y,or_Z at end indicates whether measure is along a particular axis
names(SubsetDF)[3:35]<-gsub("-mean","",names(SubsetDF)[3:35])
names(SubsetDF)[36:68]<-gsub("-std","",names(SubsetDF)[36:68])
names(SubsetDF)<-gsub("\\()","",names(SubsetDF))
names(SubsetDF)<-gsub("-","_",names(SubsetDF))
names(SubsetDF)[3:35]<-paste("Mean_",names(SubsetDF)[3:35],sep="")
names(SubsetDF)[36:68]<-paste("StDv_",names(SubsetDF)[36:68],sep="")
#create data frame of summary statistic (mean) of all variables 
#based on 180 unique combinations of SubjID (n=30) and Activity (n=6)
SummaryDF<-aggregate(.~SubjID+Activity,data=SubsetDF,mean)
#output summary data frame to a text file
write.table(SummaryDF,"HAR_Data_by_Subject_and_Activity.txt")