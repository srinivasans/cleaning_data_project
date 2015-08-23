#Training Data
subject_tr <- read.table("./dataset/train/subject_train.txt")
X_tr <- read.table("./dataset/train/X_train.txt")
Y_tr <- read.table("./dataset/train/y_train.txt")
#Testing Data
subject_t <- read.table("./dataset/test/subject_test.txt")
X_t <- read.table("./dataset/test/X_test.txt")
Y_t <- read.table("./dataset/test/y_test.txt")
#Merged Data
subject<-rbind(subject_t,subject_tr)
names(subject)<-"ID"
X<-rbind(X_t,X_tr)
Y<-rbind(Y_t,Y_tr)


#Feature and Activity Label Extraction
features <- read.table("./dataset/features.txt",col.names=c("id","feature"))
activities <- read.table("./dataset/activity_labels.txt",col.names=c("id","activity"))
# FIlter of Mean and STD Features
mean_std<-grep("mean|std",features$feature)

# Applying Filters
X_filtered <- X[,mean_std]
names(X_filtered)<- gsub("\\(|\\)","",features$feature[mean_std])
names(Y)<-"activityId"
Y_activity <- merge(Y,activities,by.x="activityId",by.y="id")

#Merged Data
activity <- Y_activity$activity
XY_data <- cbind(subject,X_filtered,activity)
write.csv(XY_data,"filtered_data_merged.csv")

#Average Data by subject and activity
library(data.table)
dataDT <- data.table(XY_data)
average <- dataDT[,lapply(.SD,mean),by=c("ID","activity")]
write.table(average,"average_data.txt",row.name=FALSE)

