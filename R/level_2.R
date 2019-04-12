library(tidyverse)
library(ggthemes)
library(ggplot2)    
library(rio)
library(infer)

#第一题
set.seed(1212)
N=1000
R=rnorm(N, mean=0.4, sd=0.05)
M=runif(5,350,400)
L=runif(5,3000,4000) 
S=L*R #收入
INCOME=M*S
Cpl=runif(5,8,10)
H=20000
Expenses=Cpl*L+H #成本
Profit=INCOME-Expenses



#第4题
data <- read.csv("Data/cpl_and_conversion.csv")
cor_matr = cor(data) #相关矩阵
cor_matr
data %>% 
ggplot(aes(cost_per_lead, conversion_rate)) +
  geom_line(size = 1, color = "grey30") #数据实际分布图

test_mod <- lm(conversion_rate ~ cost_per_lead, data = data) #线性预测？
test_mod
predict(test_mod,newdata=data.frame(cost_per_lead=9.8),interval="confidence")




