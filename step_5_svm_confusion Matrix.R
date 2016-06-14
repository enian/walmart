#install.packages("e1071")
#install.packages("RTextTools")

library(e1071)
library(caret)
rm(list=ls())

# Laptop
file
new<-read.csv("C:/Users/Rahul/Dropbox/CKME 136 CAPSTONE PROJECT/wm_Data/SVM_TRY_JUNE_8/joined_1_28_reduced.csv")

# office
new<-read.csv("C:/SVM_CONFUSION MATRIX/__3_stores_data_merged/produc_pid_9_sid_1-14-32_iteration_2.csv")


names(new)
#head(new)
attach(new)

# detach(data)

x <- subset(new, select=-volume_sales)
y <- volume_sales

names(x)


svm_model <- svm(volume_sales ~ ., data=new,type="C-classification")
summary(svm_model)
sales_predict<-predict(svm_model,x)
table(sales_predict,y)

svm_tune <- tune(svm, train.x=x, train.y=y,kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))
print(svm_tune)


svm_model_after_tune <- svm(volume_sales ~ ., data=new, kernel="radial", cost=1, gamma=0.5)
summary(svm_model_after_tune)
pred <- predict(svm_model_after_tune,x)


table(pred,y)
table(sales_predict,y)

# confusion matrix
#install.packages('caret')
library(caret)

split=0.80
trainIndex <- createDataPartition(new$volume_sales, p=split, list=FALSE)
data_train <- new[trainIndex,]
data_test <- new[-trainIndex,]
confusionMatrix(data_train$volume_sales,predict(svm_model_after_tune,data_train))

# FOR PRINTING

summary(svm_model)
table(sales_predict,y)
print(svm_tune)
summary(svm_model_after_tune)
table(pred,y)
table(sales_predict,y)
confusionMatrix(data_train$volume_sales,predict(svm_model_after_tune,data_train))
