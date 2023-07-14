#' BTC1855H Assignment 4 - "Martians are Coming"
#' Nishant Sarkar

#' This code completes the requirements set out in the "Assignment 4" module.
#' Please ensure that ufo_subset.csv is in your working directory.

#' Loading tidyverse package.
#' Ensure you have tidyverse installed (not just dplyr!)
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
  mutate(datetime = as.Date(datetime), date_posted = as.Date(format(dmy(date_posted), "%Y-%m-%d"))) %>%  # Converting dates to ymd format. Datetime is already ymd, so as.Date is used to convert it to a date. date_posted is dmy, so the format() command is used to convert it to ymd. 
  mutate(is_hoax = str_detect(tolower(comments), "hoax|star|capella|arcturus|sirius|vega|ISS|mercury|venus|mars|jupiter|saturn|star|stars|bird|celestial|aircraft|airplane|satellite|advertising|meteor|sky diver", negate = FALSE) &
           !str_detect(tolower(comments), "not a hoax|not a star", negate = FALSE))
           #' The above code adds an is_hoax column. It checks the comments column for a list of keywords using the str_detect function in the stringr package, and if the entry has one of these keywords and does not include the phrases "not a hoax" or "not a star", it is flagged
           #' as TRUE in is_hoax. This comes with several drawbacks. All of these words are only indicative of a hoax if they are included in a NUFORC comment, but as written, this code checks the whole comments entry. Consequently, if the original entry made some reference to one
           #' of these words (ex. "star-shaped UFO"), it will still be marked as a hoax even without a NUFORC comment. However, just using "hoax" is not enough - this code was written under the assumption that "hoax" refers to anything that NUFORC thinks isn't a UFO, as per Dr. K.
           #' Also, it is possible that some keywords are missing. Still, the code accurately classifies most of the hoax/incorrect entries.

# Creating a table reporting the percentage of hoax sightings per country. It first groups the tibble by country, then uses the summary() function to create a summary table. The summary table calculates the mean of "is_hoax" for each group and multiplies by 100 to find the percentage of
# TRUE values in the is_hoax column. 
percent_hoax <- ufo_data_tidy %>%
  group_by(country) %>%
  summarize(percent_hoax = mean(is_hoax, na.rm = TRUE)*100)
view(percent_hoax)



