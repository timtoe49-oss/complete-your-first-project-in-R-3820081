
library(tidyverse)
library(readr)
# LOAD DATA ######
# Read in a survey data of how Americans heat their homes
heating <- read_csv("heating.csv")
glimpse(heating)
head(heating)
colnames(heating)
# Tidy the data ####
heating <- heating %>%
  gather(key = "age", value = "homes", -Source)

# Summarize the data
summary(heating)

# convert home from characetr to numeric
heating %>%
  mutate(homes = as.numeric(homes)) %>%

# MISSING VALUES ####
# important warning mesaage: NAs introduced by coersion
# investigate those values

heating %>%
  filter(is.na(as.numeric(homes)))

# it was discovered fromn contact with US census berau 
# that . was used for 0 valuesand Z for values close to zero

heating %>%
  mutate(homes = ifelse(homes == ".", 0, homes)) %>%
  mutate(homes = ifelse(homes == "Z", 0, homes)) %>%
  mutate(homes = as.numeric(homes)) %>%
  filter(Source == "Cooking stove") %>%

heating_df <- heating %>%
  mutate(homes = ifelse(homes == ".", 0, homes)) %>%
  mutate(homes = ifelse(homes == "Z", 0, homes)) %>%
  mutate(homes = as.numeric(homes))

summary(heating_df)



# MISSING ROWS ####
# more difficult to detect than missing values

# Load the data file
land <- read_csv("publiclands.csv")
view(land)
summary(land)
nrow(land)

# There are 50 states. Some data are missing.
unique(land$State)
# Find which states are missing

# Looking at the source of the data US Forsest Services website
# it was discovered that Connecticut, Delaware, Hawaii, Iowa, Maryland
# Massachussetts, New Jersey and Rhode Island have 0 or less than
# 500 hecatres of national forest land

missing_states <- tibble(State = c("Connecticut", "Delaware", "Hawaii", "Iowa",
                                    "Maryland", "Massachussetts", "New Jersey",
                                    "Rhode Island"),
                         PublicLandAcres = c(0, 0, 0, 0, 0, 0, 0, 0))

land <- rbind(land, missing_states) # row bind the missing states
View(land)

# LOAD ANOTHER DATA
employees <- read_csv("employees.csv")
View(employees)

# Let's do aggregate
# Suppose we want to know the total payrol of the company
sum(employees$Salary)

mean(employees$Salary)
max(employees$Salary)
# due to the missing value we can't calculate aggregate value

sum(employees$Salary, na.rm = TRUE)
mean(employees$Salary, na.rm = TRUE)
max(employees$Salary, na.rm = TRUE)
