library(tidyverse)
library(readr)

# LOAD DATA #########
credit_df <- read_csv("credit_risk_dataset.csv")
glimpse(credit_df)
View(credit_df)
sum(is.na(credit_df))
missing_values <- sapply(credit_df, function(x) sum(is.na(x)))
missing_values
sapply(credit_df, typeof)
credit_df |> mutate(across(person))
# Convert all character columns to factors

credit_df_fct <- credit_df |>
  mutate(across(where(is.character), as.factor))
summary(credit_df_fct)

credit_df_fct |>
  filter(person_age >= 100)

cor(credit_df_fct$person_age, credit_df_fct$person_income)

plot(credit_df_fct$person_age, credit_df_fct$person_income)

high_earners_df <- credit_df_fct |>
  filter(person_income > 200000) |>
  filter(person_age <= 95)
summary(high_earners_df)
nrow(high_earners_df)
nrow(credit_df_fct)
