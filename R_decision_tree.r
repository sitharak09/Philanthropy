data <- Management_final
str(data)

# Partition into training and validation set
set.seed(1234)
pd <- sample(2,nrow(data),replace=TRUE,prob=c(0.8,0.2))
train <- data[pd==1,]
validate <- data[pd==2,]

#Decision tree with rpart
library(rpart)
control <- rpart.control(minsplit=4)
dtree <- rpart(GIFT_AMOUNT_2018_NEW ~ .,data=train,control='control')
dtree
library(rpart.plot)
rpart.plot(dtree)
#To write to an excel file
install.packages("writexl")
library(writexl)
write_xlsx(x=train,path="C:/Users/user/Desktop/UB/DS dataset/out.xlsx",col_names=TRUE)