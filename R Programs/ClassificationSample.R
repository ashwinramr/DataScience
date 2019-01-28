#Classification Sample
# Load rpart and rpart.plot for CART

table(iris$Species)
#    setosa versicolor  virginica 
#     50         50         50 

# Classification Step 1 - Profiling

#Sample to split train and test data
s <- sample(1:150, size=100)
# Pick 100 from iris for train
iris.train <- iris[s,]
# pick 50 from iris for test
iris.test <- iris[-s,]

table(iris.train$Species)
# setosa versicolor  virginica 
# 34         33         33 

#Classifier Model
m1 <- rpart(Species ~., data = iris.train, method = 'class')
m1
rpart.plot(m1)

#Classification Step 2 - Predicting
iris.test$Predict <- predict(m1,iris.test,type='class')
table(iris.test$Species,iris.test$Predict)
