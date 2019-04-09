#lab section in CH 5 of An Introduction to Statistical Learning with
#                       Applications in R 
#using data available: https://www.kaggle.com/ronitf/heart-disease-uci/version/1
#examine relationship between age and serum cholesterol (mg/dl)

#FILE CREATED: 4.9.2019
#LAST UPDATED: 4.9.2019

setwd("~/Desktop/statistical-learning--master/")
dat = read.csv("heart.csv")

#can use csv.glm() function for k-fold cross validation 
#will set k to 10

library(boot)
set.seed(15)

cv.error.10 = rep(0,10)
for (i in 1:10 ){
  glm.fit = glm(age~poly(chol, i), data = dat)
  cv.error.10[i] = cv.glm(dat, glm.fit, K = 10)$delta[1]
}

cv.error.10 
#results = 7.958645e+01  7.962417e+01  8.972756e+01  2.275541e+02  2.007743e+02
#           3.508804e+03  1.368744e+04  1.224295e+06  1.917000e+06  9.656673e+06