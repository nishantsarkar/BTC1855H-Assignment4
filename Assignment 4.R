#' BTC1855H Assignment 4 - "Martians are Coming"
#' Nishant Sarkar

#' This code completes the requirements set out in the "Assignment 4" module.
#' Please ensure that ufo_subset.csv is in your working directory.

# Loading tidyverse package.
library(tidyverse)

# Loading ufo_subset.csv. "read_csv" is used to create a tibble. 
ufo_data <- read_csv("ufo_subset.csv")
# Removing spaces in ufo_data column names using make.names(), which replaces space characters with a "."
names(ufo_data) <- make.names(names(ufo_data), unique = TRUE)

# Tidying ufo_data according to the assignment requirements.
ufo_data_tidy <- ufo_data %>%
  distinct() %>%                                                       # Removing duplicate rows using distinct() function based on all columns
  mutate(shape = ifelse(is.na(shape), "unknown", shape)) %>%           # Finding rows where 'shape' is missing, and replacing with "unknown" by checking if the value is NA
  drop_na(country) %>%                                                 # Removing rows where the country column has an NA value
  mutate(datetime = as.Date(datetime), date_posted = as.Date(format(dmy(date_posted), "%Y-%m-%d")))  # Converting dates to ymd format. Datetime is already ymd, so as.Date is used to convert it to a date. date_posted is dmy, so the format() command is used to convert it to ymd. 
           



