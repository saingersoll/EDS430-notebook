# load packages----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)

# read in processed lake data ----
# avoid using here inside of ur app, it doesn't always work
lake_data <- read_csv('data/lake_data_processed.csv')

