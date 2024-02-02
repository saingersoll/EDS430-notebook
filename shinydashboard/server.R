server <- function(input, output) {
  
  # filtered lake data
  filtered_lakes_df <- reactive (
    {
    lake_data %>% 
    filter(elevation >= input$elevation_slider_input[1] & elevation <= input$elevation_slider_input[2]) %>% 
    filter(avg_depth >= input$depth_slider_input[1] & avg_depth <= input$depth_slider_input[2]) %>% 
    filter(avg_temp >= input$temp_slider_input[1] & avg_temp <= input$temp_slider_input[2])
    }
  )
  

  # Building map 
  output$lake_map_output <- renderLeaflet(
    {
      # build leaflet map ----
      # initialize map & set zoom in standard and location with a bounding box on zoomed in area
      leaflet() %>% 
        
        addProviderTiles(providers$Esri.WorldImagery) %>% 
        
        setView(lng = -152.05,
                lat = 70.25,
                zoom = 6) %>% 
        
        addMiniMap(toggleDisplay = TRUE,
                   minimized = FALSE) %>%  
        # include an inset map overview highlighting our region of interest
        addMarkers(data = filtered_lakes_df(),
                   lng = filtered_lakes_df()$longitude,
                   lat = filtered_lakes_df()$latitud,
                   popup = paste0(
                     "Site Name: ", filtered_lakes_df()$site, "<br>",       # "<br>" is html code to indicate a break in text
                     "Elevation: ", filtered_lakes_df()$elevation, " meters (above sea lvl)", "<br>",
                     "Avg Depth: ", filtered_lakes_df()$avg_depth, " meters", "<br>",
                     "Avg Lake Bed Temperature: ", filtered_lakes_df()$avg_temp, "\u00B0C"  # unicode for degree symbol, the C is for celcisus º. Can also use option 0 
                   )
        )
    }
  )
    
}
