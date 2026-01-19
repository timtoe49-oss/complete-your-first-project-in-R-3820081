library(tidyverse)
library(readr)
# LOAD DATA ######
# Read in a survey data of how Americans heat their homes
heating <- read_csv("heating.csv")
glimpse(heating)
head(heating)
