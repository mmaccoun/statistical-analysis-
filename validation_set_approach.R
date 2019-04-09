#lab section in CH 5 of An Introduction to Statistical Learning with
#                       Applications in R 
#using data available: https://www.kaggle.com/ronitf/heart-disease-uci/version/1
#examine relationship between age and serum cholesterol (mg/dl)

#FILE CREATED: 4.8.2019
#LAST UPDATED: 4.8.2019 

setwd("~/Downloads")
dat = read.csv("./heart.csv")

library(ISR)
#to ensure results are replicable 
set.seed(100)

#split data set of obserations in half 
train = sample(303, 151)
#fit linear regression using only the observations corresponding 
#   to the training set 
lm.fit = lm(age~chol, data = dat, subset = train)

#use predict() function to estimate response for all observations
#use mean() function to calculate MSE of the validation set 

#VALIDATION SET ERROR RATE FOR MODEL WITH LINEAR TERMS 
linear = mean((age-predict(lm.fit,dat))[-train]^2)

#use the poly() function to estimate the test error for the quadratic
#   and cubic regressions 
lm.fit2 = lm(age~poly(chol, 2), data = dat, subset = train)

#VALIDATION SET ERROR RATE FOR MODEL WITH QUADRATIC TERMS
quad = mean((age-predict(lm.fit2, dat))[-train]^2)

lm.fit3 = lm(age~poly(chol, 3), data=dat, subset = train)

#VALIDATION SET ERROR RATE FOR MODEL WITH CUBIC TERMS 
cube = mean((age-predict(lm.fit3, dat)) [-train]^2)
     
print(linear)
print(quad)
print(cube)
