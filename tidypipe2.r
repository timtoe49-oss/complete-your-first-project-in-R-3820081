library(tidyverse)
library(readr)

# LOAD DATA ####
un_data_long <- read_csv("un_data_long.csv")

un_data_wide <- read_csv("un_data_wide.csv")

#VIEW DATA ####
glimpse(un_data_long)
head(un_data_wide)

# Chart: wide data ####

un_data_wide %>%
  ggplot() +
  aes(x = eom) +
  geom_line(aes(y = births,
                color = country)) +
  geom_line(aes(y = deaths,
                color = country),
            linetype = "dashed") +
  scale_x_date(date_labels = "%b\n%Y",
               breaks = "month")
