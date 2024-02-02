# load packages ----
library(tidyverse)
library(leaflet)

# read in data ----
# here package is for better reproduciblity, doesn't require / \ directions
lake_data <- read_csv(here::here('shinydashboard', 'data', 'lake_data_processed.csv'))



# practice filtering ----
filtered_lakes <-  lake_data %>% 
  filter(elevation >= 8 & elevation <= 20)  %>% 
  filter(avg_depth >= 2 & avg_depth <= 3) %>% 
  filter(avg_temp >= 4 & avg_temp <= 6)
  




# build leaflet map ----
# initialize map & set zoom in standard and location with a bounding box on zoomed in area
leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  setView(lng = -152.05,
          lat = 70.25,
          zoom = 6) %>% 
  addMiniMap(toggleDisplay = TRUE,
             minimized = FALSE) %>%            # include an inset map overview highlighting our region of interest
  addMarkers(data = filtered_lakes,
             lng = filtered_lakesa$longitude,
             lat = filtered_lakes$latitude,
             popup = paste0(
               "Site Name: ", filtered_lakes$site, "<br>",       # "<br>" is html code to indicate a break in text
               "Elevation: ", filtered_lakes$elevation, " meters (above sea lvl)", "<br>",
               "Avg Depth: ", filtered_lakes$avg_depth, " meters", "<br>",
               "Avg Lake Bed Temperature: ", filtered_lakes$avg_temp, "\u00B0C"  # unicode for degree symbol, the C is for celcisus º. Can also use option 0 
             )
            )


