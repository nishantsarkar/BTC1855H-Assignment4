# BTC1855H-Assignment4
Assignment 4 for BTC1855H - Coding in R (Martians are Coming)

This script completes the following requirements:
- Loads UFO data into a data frame, ensuring that column names do not have spaces in them
- Rows where Shape Information is missing are imputed with "unknown"
- Rows without Country information are removed
- Datetime and Date-posted columns are converted to appropriate formats
- An is_hoax column is added to filter entries which may be hoaxes
- A table with hoax sightings per country is created
- A report_delay column is added documenting the time difference between the date of the sighting and reporting
- Entries which are reported before the sighting date are removed
- A table with average report_delay per country is created
- The quality of the 'duration seconds' column is improved
- The 'duration seconds' column is used to create a histogram
