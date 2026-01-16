library(tidyverse)
library(readr)
library(vcdExtra)
# %>% pipe operator is from the magrittr package, tidyverse
"Hello world" %>%
  rep(5)

msleep %>% #(ctrl + shift + M) shortcut inserts the pipe operator
  count(conservation)

vore_summary <- msleep %>%
  count(vore) %>%
  arrange(desc(n))

vore_summary

# |> pipe operator is part of R base since r 4.1.0
"Hello world" |>
  rep(5)

msleep |>
  count(conservation)

midwest
colnames(midwest)

midwest |>
  select(state, county)

midwest |>
  select(1, 2)
midwest |>
  select(PID:poptotal)

midwest |>
  select(PID:poptotal, contains("perc")) 
#columns that contain perc (percentage)

midwest |>
  select(PID:poptotal, !contains("perc")) |>
  select(PID:poptotal, !contains("perc"))ct(starts_with("pop"))

??select

gss_cat

gss_cat %>%
  filter(age >= 30)

# modify existing or create new columns in a data.frame
# using Mutate()

msleep_processed <- msleep |>
  mutate(sleep_non_ram = sleep_total - sleep_rem) |>
  mutate(sleep_total = sleep_total / 24)

msleep_processed

# Advanced pipe usage

msleep_processed |>
  mutate(across(contains("sleep"), ~ . /24))
# divide all sleep columns by 24

arrange(
  filter(
    mutate(
      select(
        msleep,
        c(name, conservation, sleep_total, sleep_rem)
      ),
      sleep_total_perc = sleep_total / 24
    ),
    !is.na(conservation),
    !is.na(sleep_rem),
    sleep_total_perc < 0.5
  ),
  desc(sleep_rem)
)

#Rewrite the above code using pipe operator 

msleep |>
  select(c(name, conservation, sleep_total, sleep_rem)) |>
  mutate(sleep_total_perc = sleep_total / 24) |>
  filter(
    !is.na(conservation),
    !is.na(sleep_rem),
    sleep_total_perc < 0.5
  ) |>
  arrange(desc(sleep_rem))
