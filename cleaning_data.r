library(tidyverse)
library(readr)
# LOAD DATA ######
# Read in a survey data of how Americans heat their homes
heating <- read_csv("heating.csv")
glimpse(heating)
head(heating)

# Tidy the data ####
heating <- heating %>%
  gather(key ="age", value = "homes", -Source)
heating_tibble <- as_tibble(heating)
heating_tibble

heating_fct <- heating_tibble %>%
  mutate(age = factor(age),
         Source = factor(Source),
         homes = as.integer(homes))
heating_fct
levels(heating_fct$age)
levels(heating_fct$age) <- c("25-29", "30-34", "35-44", "45-54",
                              "55-64", "65-74", "75+", "25-")
levels(heating_fct$age)

heating_tibble %>% 
  filter(is.na(as.numeric(homes)))
