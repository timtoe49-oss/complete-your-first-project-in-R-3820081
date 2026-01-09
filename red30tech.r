getwd()
?rmarkdown
??rmarkdown
library(rmarkdown)
??openxlsx
install.packages("openxlsx")
library(openxlsx)
# LOAD DATA
sales <- read.xlsx("Red30_Tech_Sales.xlsx", 1, detectDates = TRUE)
sales
colnames(sales)
library(data.table)
library(tidyverse)

sales |> 
  summarize(across(where(is.numeric), 
                   list(mean = mean, median = median, sd = sd), na.rm = TRUE))

install.packages("skimr")
library(skimr)
skim(sales)
