# NEW EXAMPLE Knn CORSS VALIDATION
rm(list=ls())
wm<-read.csv("C:/Users/Rahul/Dropbox/CKME 136 CAPSTONE PROJECT/Working Datasets/1_9/1_9.csv")
attach(wm)
table(wm$volume_sales)
head(wm)
dim(wm)
set.seed(9850)
wm[2]
# mixing up the data set
gp<-runif(nrow(wm))
gp
wm<-wm[order(gp),]

head(wm)
str(wm)
summary(wm[c(1:12)])
# rescale the features normalization

normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))}
normalize(c(10,02,30,40,50))
names(wm)

walmart_n <-as.data.frame(lapply(wm[,c(1,3,4,5,6,7,8,9,10,11,12)],normalize))
str(walmart_n)
summary(walmart_n)

walmart_train<-walmart_n[1:822,]
walmart_test<-walmart_n[823:914,]
walmart_train_target<-wm[1:822,2]
walmart_test_target<-wm[823:914,2]

require(class)
m1<-knn(train=walmart_train,test=walmart_test,cl=walmart_train_target,k=13)
m1
table(walmart_test_target,m1)
summary(m1)


