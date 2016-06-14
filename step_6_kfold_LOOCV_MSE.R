rm(list=ls())
install.packages('boot')
library(boot)
library(ISLR)
file="C:/Users/Rahul/Dropbox/CKME 136 CAPSTONE PROJECT/wm_Data/SVM_CONFUSION MATRIX/K fold/produc_pid_9_sid_1-14-32_iteration_1.csv"
ds<-read.csv(file)
attach(ds)
cool
names(ds)
head(ds)
units
set.seed(0)
#### LOOCV Approch
# fiting a linear model for volume_sales vs heat

model_heat = glm(volume_sales~heat,data=ds)
MSE_LOOCV_heat <-cv.glm(ds,model_heat)
MSE_LOOCV_heat$delta[1]
MSE_LOOCV_heat<-NULL
for (i in 1:10){
  model_heat=glm(volume_sales~poly(heat,i),data=ds)
  MSE_LOOCV_heat[i]=cv.glm(ds,model_heat)$delta[1]
}
MSE_LOOCV_heat

#### LOOCV Approch
# fiting a linear model for volume_sales vs cool

model_cool = glm(volume_sales~cool,data=ds)
MSE_LOOCV_cool <-cv.glm(ds,model_cool)
MSE_LOOCV_cool$delta[1]
MSE_LOOCV_cool<-NULL
for (i in 1:10){
  model_cool=glm(volume_sales~poly(cool,i),data=ds)
  MSE_LOOCV_cool[i]=cv.glm(ds,model_cool)$delta[1]
}
MSE_LOOCV_cool

#### LOOCV Approch
# fiting a linear model for volume_sales vs avgspeed

model_avgspeed = glm(volume_sales~avgspeed,data=ds)
MSE_LOOCV_avgspeed <-cv.glm(ds,model_avgspeed)
MSE_LOOCV_avgspeed$delta[1]
MSE_LOOCV_avgspeed<-NULL
for (i in 1:10){
  model_avgspeed=glm(volume_sales~poly(avgspeed,i),data=ds)
  MSE_LOOCV_avgspeed[i]=cv.glm(ds,model_avgspeed)$delta[1]
}
MSE_LOOCV_avgspeed



MSE_LOOCV_heat
MSE_LOOCV_cool
MSE_LOOCV_avgspeed
#> MSE_LOOCV_heat
#[1] 0.07335681 0.07343325 0.07337933 0.07302030 0.07368979 0.07266059 0.07386527 0.07400949 0.09250403 0.09713786
#> MSE_LOOCV_cool
#[1] 0.07319682 0.07321736 0.07312629 0.07296258 0.07298301 0.07298469 0.07307451 0.07310758 0.07311256 0.07306685
#> MSE_LOOCV_avgspeed
#[1] 0.07383216 0.07404738 0.07419279 0.07431361 0.07459416 0.07486353 0.07519920 0.07721817 0.07575171 0.15774761

# K fold Cross Validation

MSE_10_fold_cv=NULL

for(i in 1:10){
  model=glm(volume_sales~poly(heat,i),data=ds)
  MSE_10_fold_cv[i]=cv.glm(ds,model,K=10)$delta[1]
}
MSE_10_fold_cv

# > MSE_10_fold_cv
# [1] 0.07382080 0.07385505 0.07356480 0.07312928 0.07362466 0.07552053 0.07388147 0.07559254 0.09155409 0.10815405

