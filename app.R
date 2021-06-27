projectData <- read.csv("high_school_dropout_rate_usafacts.csv")
projectData <- projectData %>% slice(-c(2, 6, 10, 12, 17, 21, 26))
projectData <- projectData[49:54]
for (row in (projectData %>% slice(c(16, 17, 18, 19)))) {
  print(mean(row, na.rm = T))
}
projectData$X2017[16] <- 0.419
projectData$X2018[16] <- 0.419
projectData$X2017[17] <- 0.249
projectData$X2018[17] <- 0.249
projectData$X2017[18] <- 0.0485
projectData$X2018[18] <- 0.0485
projectData$X2017[19] <- 0.11
projectData$X2018[19] <- 0.11
set.seed(1)
train_set <- sample(2, nrow(projectData), prob = c(0.8, 0.2), replace = TRUE)
train_data <- projectData[train_set == 1, ]
test_setdata <- projectData[train_set == 2, ]
library(timeSeries)
library(nnfor)
projectData <- ts(as.vector(as.matrix(projectData)))
predictor <- auto.arima(ts(projectData))
model <- forecast(predictor)
# The highest percentages of dropout rates go to the group of individuals who are Hispanic, Employed, Male, in the lower quartile of income
