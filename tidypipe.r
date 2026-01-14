library(tidyverse)
library(readr)

"Hello world" %>%
  rep(5)

msleep %>% #(ctrl + shift + M) shortcut inserts the pipe operator
  count(conservation)

vore_summary <- msleep %>%
  count(vore) %>%
  arrange(desc(n))

vore_summary
