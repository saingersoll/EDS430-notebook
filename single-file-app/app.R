# load packages ----
library(shiny)
library(DT)
library(tidyverse)
library(palmerpenguins)
library(bslib)
library(thematic)

thematic::thematic_shiny()

# user interface ----
ui <- fluidPage(
  
  # set theme argument ----
  theme = bs_theme(
    
    bg = "#a36F6F",
    fg = "#FDF7F7",
    primary = '#483132',
    base_font = font_google('Sixtyfour')
  ),
  
  # app title ----
  tags$h1("Palmer Penguins Interactive Dashboard"),
  
  # app subtitle ----
  h4(strong("Exploring Trends in Antarctic Penguin Data")),
  
  # body mass slider input ----
  sliderInput(
    inputId = "body_mass_input",
    label = "Select a range of body masses (g):",
    min = 2700,
    max = 6300,
    value = c(3000, 4000)
  ),
  
  # body mass plot output ----
  plotOutput(
    outputId = "body_mass_scatterplot_output"
  ),
  
  # year input ----
  checkboxGroupInput(inputId = 'year_input',
                     label = "Select year(s):",
                     choices = unique(penguins$year),
                     selected = c('2007', '2008')),
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_DT_output")
  
)


# server ----
server <- function(input, output) {
  
  # filter body masses ----
  body_mass_df <- reactive(
    
    { # filter for body mass using selected inputs
      penguins %>% 
        filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2]))
    }
  )
  
  # render penguin scatterplot ----
  # code to generate plot
  output$body_mass_scatterplot_output <- renderPlot(
    
    {# add ggplot code here ----
      # follow any reactive df with a () at the end
      ggplot(na.omit(body_mass_df()),
             aes(x = flipper_length_mm,
                 y = bill_length_mm,
                 color = species,
                 shape = species)
      ) +
        geom_point() +
        scale_color_manual(values = c('Adelie' = 'darkorange','Chinstrap'= 'purple','Gentoo'='cyan4')) +
        scale_shape_manual(values = c(19, 17, 15)) +
        labs(x = "Flipper length (mm)",
             y = "Bill length (mm)",
             color = 'Penguin Species',
             shape = "Penguin Species") +
        theme_minimal() +
        theme(legend.position = c(0.85, 0.2),
              legend.background = element_rect(color = 'lightgrey')
        )
    }
  )
  
  # filter for years ----
  years_df <- reactive(
    
    { # return observations for year input selected
      penguins %>% 
        filter(year %in% c(input$year_input))
    }
  )
  
  # render the DT::datatable ----
  output$penguin_DT_output <- DT::renderDataTable(
    
    {# create a datable without rownames
      DT::datatable(years_df(),
                    options = list(pagelength = 10),
                     rownames = FALSE
                    )2
    }
  )
  
}

# combine UI and server into app ----
shinyApp(ui = ui, server = server)