#lab section in CH 5 of An Introduction to Statistical Learning with
#                       Applications in R 
#using data available: https://www.kaggle.com/ronitf/heart-disease-uci/version/1
#examine relationship between age and serum cholesterol (mg/dl)

#FILE CREATED: 4.9.2019
#LAST UPDATED: 4.9.2019

setwd("~/Desktop/statistical-learning--master/")
dat = read.csv("heart.csv")

#the glm() function can be used with the cv.glm() function
#   both are part of the boot library 

library(boot)
library(stats)

glm.fit = glm(age~chol, data = dat)
#cv.glm produces list with several components
cv.err = cv.glm(dat, glm.fit)
#the two components in the delta vector contain cross-validation results 
cv.err$delta
#results = 79.41228 79.41070

#can also try fitting regressions for polynomials of order i=1 to i=5
#   the computed associated cross-validation error will be stored in
#       the ith element of the vector cv.error 
cv.error = rep(0,5)
for(i in 1:5){
  glm.fit = glm(age~poly(chol, i), data = dat)
  cv.error[i] = cv.glm(dat, glm.fit)$delta[1]
}
cv.error
#results: 79.41228  79.64048  80.20418 240.41997  95.75140
