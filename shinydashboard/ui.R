# dashboard header --------------------
header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboard header ----

# dashboard sidebar --------------------
sidebar <- dashboardSidebar(
  
  # menu items for sidebar ----
  sidebarMenu(
    
    menuItem(
      # text to include and identifier
      text = "Welcome",
      tabName = "welcome",
      icon = icon("star")
    ), # END menuItem ----
    
    menuItem(
      text = "Dashboard",
      tabName = "dashboard",
      icon = icon('gauge')
    ) # END menuItem ----
    
  ) # END sidebarMenu ----
  
  
) # END dashboard sidebar ----

# dashboard body --------------------
body <- dashboardBody(
  
  # add content to the body of app using tabItems() ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(
      
      tabName = 'welcome',
      
      # left-hand column ----
      column(
        width = 6,
        
        # background info box ----
        # NULL will make width take on size of column
        box(width = NULL,
            
            title = tagList(icon('water'),
                            strong('Monitoring Fish Creek Watershed')),
            includeMarkdown('text/intro.md'),
            tags$img(src = 'FishCreekWatershedSiteMap_2020.jpg',
                     alt = 'A map of Northern Alaska, showing Fish Creek Watershed, loaded within the National Petroleum Reserve.',
                     style = "max-width: 100%;"),  # CSS declarations are done with a "property : amount;" this will fit our image nicely
            tags$h6(
              tags$em("Map Source:",               # this emphasis gives italicized 
                      tags$a(href = 'http://www.fishcreekwatershed.org/',  # add hyperlink
                             'FCWO')
                      ),
              style = "text-align: center;"        # center text
            )
        ) # END background box ----
        
      ), # END column ----
      
      
      # right-hand column
      column(
        width = 6,
        
        # Creating first stack box using fluidRow ----
        fluidRow(
          
          # citation box ----
          box(
            width = NULL,
            
            title = tagList(icon('book'),
                            strong('Data Source')),
            includeMarkdown('text/citation.md')
            
          ) # END citation box
          
        ), # END fluidRow ----
        
        
        # second fluidRow ---
        fluidRow(
          
          # disclaimer box
          box(
            width = NULL,
            
            title = tagList(icon('warning'),
                            strong('Disclaimer')),
            includeMarkdown('text/disclaimer.md')
            
          ) # END disclaimer box
          
        ) # END fluidRow
        
      ) # END right-hand column ----
      
      
    ), # END welcome tabItem ----
    
    # dashboard tabItem ----
    tabItem(
      
      tabName = "dashboard",
      
      
      # fluidRow ----
      # the value of the box widths and heights need to add up to 12
      fluidRow(
        
        # input box ----
        box(width =4,
            
            title = tags$strong('Adjust Lake Parameter Ranges: '),
            
            # sliderInputs ----
            sliderInput(inputId = "elevation_slider_input",
                        label = "Elevation (meters above sea lvl):",
                        min = min(lake_data$elevation),
                        max = max(lake_data$elevation),
                        value = c(min(lake_data$elevation), 
                                  max(lake_data$elevation))
            ), # END sliderInput elevation ----
            
            # sliderInputs ----
            sliderInput(inputId = "depth_slider_input",
                        label = "Depth (meters):",
                        min = min(lake_data$depth),
                        max = max(lake_data$depth),
                        value = c(min(lake_data$depth), 
                                  max(lake_data$depth))
            ), # END sliderInput Depth
            
            
            # sliderInputs ----
            sliderInput(inputId = "temp_slider_input",
                        label = "Temperature (ºC):",
                        min = min(lake_data$temp),
                        max = max(lake_data$temp),
                        value = c(min(lake_data$temp), 
                                  max(lake_data$temp))
            ) # END sliderinput Temp
            
            
        ),  # END dashboard input slide box ----
        
        box(width = 8,
            
            title = tags$strong('Monitoring Lakes Within Fish Creek Watershed:'),
            
            # leaflet output ----
            leafletOutput(outputId = "lake_map_output") %>% 
              
              withSpinner(type = 1, color = 'blue')
        ) # END leaflet output ----
        
      ) # END dashboard mapbox ----
      
      
    ) # END dashboard fluidRow ----
    
  ) # END dashboard tabItem ----
  
) # END tabItems() ----


# combine all into a dashboard page ---------
dashboardPage(
  header,
  sidebar,
  body
)  # END dashboard page ----
