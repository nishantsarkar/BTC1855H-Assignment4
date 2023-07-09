#' BTC1855H Assignment 4 - "Martians are Coming"
#' Nishant Sarkar

#' This code completes the requirements set out in the "Assignment 4" module.
#' Please ensure that ufo_subset.csv is in your working directory.

# Loading tidyverse package.
library(tidyverse)

# Loading ufo_subset.csv. "read_csv" is used to create a tibble. Initial dataset does not contain spaces in column names.
ufo_data <- read_csv("ufo_subset.csv")

# Tidying ufo_data according to the assignment requirements.
ufo_data_tidy <- ufo_data %>%
  mutate(shape = if_else(is.na(shape), "unknown", shape)) %>%          # Finding rows where 'shape' is missing, and replacing with "unknown" by checking if the value is NA
  