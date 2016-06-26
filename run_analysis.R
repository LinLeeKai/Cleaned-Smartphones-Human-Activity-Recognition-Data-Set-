# load data sets
features <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/features.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
activity_labels <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
X_test <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
y_test <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
subject_test <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
subject_train <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
X_train <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
y_train <- read.table("C:/Users/LeeKai/Desktop/cleandataproject/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)

# combine test and train data sets
testtrain<-rbind(X_test, X_train)

#write in column names
colname<-features$V2
colnames(testtrain)<-colname

#keep only mean() and std() columns
varmean<-grep("mean",names(testtrain))
varstd<-grep("std",names(testtrain))
testtrain<-subset(testtrain, select=c(varmean, varstd))
varmeanfreq<-grep("meanFreq",names(testtrain))
testtrain<-subset(testtrain, select=-c(varmeanfreq))

#merge in subject identifier
subject<-rbind(subject_test, subject_train)
colnames(subject)<-c("subject")
testtrain<-cbind(testtrain,subject)

#merge in activity labels
y_testtrain<-rbind(y_test, y_train)
colnames(y_testtrain)<-c("y_testtrain")
testtrain<-cbind(testtrain,y_testtrain)
colnames(activity_labels)<-c("y_testtrain","activity")
testtrain<-merge(testtrain,activity_labels, by="y_testtrain")
testtrain$y_testtrain<-NULL

# tidy column names
colnames(testtrain)<-sub("^t", "time", names(testtrain))
colnames(testtrain)<-sub("Acc", "Accelerometer", names(testtrain))
colnames(testtrain)<-sub("Gyro", "Gyroscope", names(testtrain))
colnames(testtrain)<-sub("Mag", "Magnitude", names(testtrain))
colnames(testtrain)<-sub("^f", "frequency", names(testtrain))
colnames(testtrain)<-sub("\\()", "", names(testtrain))
colnames(testtrain)<-sub("\\-", "", names(testtrain))
colnames(testtrain)<-sub("std", "StandardDeviation", names(testtrain))
colnames(testtrain)<-sub("\\-", "", names(testtrain))
write.table(testtrain, row.name= FALSE, file = "testtrain.txt")

# create the average of each variable for each activity and each subject
subjectactivity<-matrix(nrow=0, ncol = 68)
for (i in 1:30){
  for (j in activity_labels$activity){
    temp<-testtrain[(testtrain$activity==j & testtrain$subject==i),]
    temp<-temp[,1:66]
    meantemp<-colMeans(temp)
    meantemp<-unname(meantemp)
    meantemp<-c(i,j, meantemp)
    subjectactivity<-rbind(subjectactivity, meantemp)
    rm(temp,meantemp)
  }
}
activityname<-names(testtrain)[1:66]
colnames(subjectactivity)<-c("subject", "activity", activityname)
write.table(subjectactivity, row.names = FALSE , file = "AvgSubjectActivity.txt")