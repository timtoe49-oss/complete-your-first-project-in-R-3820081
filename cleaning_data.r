library(tidyverse)
library(readr)
# LOAD DATA ######
# Read in a survey data of how Americans heat their homes
heating <- read_csv("heating.csv")
glimpse(heating)
head(heating)

# Tidy the data ####
heating <- heating %>%
  gather(key="age", value = "homes", -Source)
heating_tibble <- as_tibble(heating)
heating_tibble

