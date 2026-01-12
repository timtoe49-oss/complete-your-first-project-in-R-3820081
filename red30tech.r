getwd()
# ?rmarkdown
# ??rmarkdown
library(rmarkdown)
# ??openxlsx
# install.packages("openxlsx")
library(openxlsx)
# LOAD DATA
sales <- read.xlsx("Red30_Tech_Sales.xlsx", 1, detectDates = TRUE)
sales
colnames(sales)
library(data.table)
library(tidyverse)
# summary of numeric variables only
numeric_df <-  sales %>%
  select(where(is.numeric)) 
summary(numeric_df)

# Another package for data summary 
#install.packages("skimr")
library(skimr)
skim(sales)

#Another way of finding out variable types
sapply(sales, typeof)

# payment status value count
table(sales$Payment.Status)
#payment status proportion
prop.table(table(sales$Payment.Status))

#check for null values in sales
is.null(sales)
sum(is.na(sales))

# sort data by order
sales[order(sales$Order.Total, decreasing = TRUE), ]

# Another way of coding this
data_mod <- sales |>
  arrange(desc(Order.Total))
data_mod <- data.table(data_mod, key = "CustState")
head(data_mod)
data_mod <- data_mod[, head(.SD, 1), by = CustState]
data_mod

#get topcustomers by total number of orders
sales |> count(CustName, sort = TRUE) |>
  slice_head(n = 10) # the first ten rows
