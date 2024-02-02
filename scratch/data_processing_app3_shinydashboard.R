# load packages ----
library(tidyverse)

# here we are going to process our data into a summarized data table to then export as a csv file
# read in raw data ----
# you can taba file when writing out a filepath/
lake_raw <- read_csv(here::here('raw_data','FCWO_lakemonitoringdata_2011_2022_daily.csv')) %>% 
  janitor::clean_names()

# avg depth and temp ----
avg_depth_temp <- lake_raw %>%  
  select(site, depth, bed_temperature) %>% 
  filter(depth != "NaN") %>% 
  drop_na(bed_temperature) %>% 
  group_by(site) %>% 
  summarize(                     # calc avg depth & temp by site 
    avg_depth = round(mean(depth),1),
    avg_temp = round(mean(bed_temperature),1)
  )

# join df ----
joined_df <- full_join(lake_raw, avg_depth_temp)

# unique lakes ----
# dropping the date column, distinct will isolate unique lakes
unique_lakes <- joined_df %>% 
  select(site, latitude, longitude, elevation, avg_depth, avg_temp) %>% 
  distinct()

# save processed data ----
# name of object, then file path destination, then the desired file name
write_csv(unique_lakes, file = here::here("shinydashboard","data", "lake_data_processed.csv"))
