getwd()
library(tidyverse)
# ?rmarkdown
# ??rmarkdown
library(rmarkdown)
# ??openxlsx
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

# get customer type by total number of orders
table(sales$CustomerType)
prop.table(table(sales$CustomerType))

# Average sales and quantity by customer type
sales |> group_by(CustomerType) |>
  summarize(
    mean_sales = mean(Order.Total, na.rm = TRUE),
    mean_quantity = mean(Quantity, na.rm = TRUE)
  )

# Total sales and quantity by customer type
sales %>% group_by(CustomerType) %>%
  summarize(
    total_sales = sum(Order.Total, na.rm = TRUE),
    total_quantity = sum(Quantity, na.rm = TRUE)
  )

#get top cutomer states by total number of orders
sales |> count(CustState, sort = TRUE)

#review product categories sold by customer state
table(sales$CustState, sales$ProdCategory)

sales_tible <- as_tibble(sales)
sales_tible

#sort data by order total
sales[order(sales$Order.Total, decreasing = TRUE), ]

#sort data by quantity
sales_tible[order(sales_tible$Quantity, decreasing = TRUE), ]

#get top employees by total number of orders
sales |> count(Employee.Name, sort = TRUE) 

#get top employee job positions by total number of orders
sales |> count(Employee.Job.Title, sort = TRUE)

#total sales and quantity by product category
sales %>%
  group_by(ProdCategory) %>%
  summarise(total_sales = sum(Order.Total, na.rm = TRUE),
    total_quantity = sum(Quantity, na.rm = TRUE)
  )

#review product categories sold by sales regions
table(sales$ProdCategory, sales$Sales.Region)

colnames(sales)
# total customers added by date added
sales |> count(DateCustAdded, sort = TRUE)

# when customers were added by the state they reside in
table(sales$DateCustAdded, sales$CustState)

sales(order(sales$DateCustAdded, decreasing = TRUE))
