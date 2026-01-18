library(tidyverse)
library(readr)
library(openxlsx)
sales <- read.xlsx("Red30_Tech_Sales.xlsx", detectDates = TRUE)
head(sales)
colnames(sales)
library(data.table)

#get order month
sales$OrderMonth <- format(sales$Order.Date, "%B")
summary(sales)

#get order year
sales$OrderYear <- format(sales$Order.Date, "%Y")
summary(sales)

#factor payment status
sales$Payment.Status <- factor(sales$Payment.Status)
summary(sales$Payment.Status)

set.seed(42)