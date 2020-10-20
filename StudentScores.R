student= read.csv("student_scores - student_scores.csv")
#making training and test data
library(caret)
id= createDataPartition(student$Scores,p=.7, list = FALSE)
id=as.vector(id)
training= student[id,]
test= student[-id,]
#plot of score VS hours
plot(student, col="green",pch=19, main="score VS hours")
model= lm(Scores~Hours,data = training )
summary(model)
# R-squared is .95 so the model is pretty accurate
y_pred= predict(model, test)
#calculating root mean squared error
RMSE(y_pred, test$Scores)
#visualisation of test results
ggplot()+ geom_point(aes(x= test$Hours, y=test$Scores), colour="green")+ 
  geom_line(aes(x= test$Hours, y=y_pred), colour="red")+xlab("Hours")+ylab("Scores")+ggtitle("Scores VS Hours")