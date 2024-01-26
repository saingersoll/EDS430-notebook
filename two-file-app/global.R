# load packages ----
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(palmerpenguins)
library(lterdatasampler)

#............custom ggplot theme (apply to both plots)...........
myCustomTheme <- function() {
  theme_light() +
    theme(axis.text = element_text(size = 12),
          axis.title = element_text(size = 14, face = "bold"),
          legend.title = element_text(size = 14, face = "bold"),
          legend.text = element_text(size = 13),
          legend.position = "bottom",
          panel.border = element_rect(linewidth = 0.7))
}



#.......................wrangle trout data.......................
clean_trout <- and_vertebrates |>
  filter(species == "Cutthroat trout") |>
  # filter columns of interest
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> 
  # converting observations to be more intitive and descriptive
  mutate(channel_type = case_when(
    channel_type == "C" ~ "cascade",
    channel_type == "I" ~ "riffle",
    channel_type =="IP" ~ "isolated pool",
    channel_type =="P" ~ "pool",
    channel_type =="R" ~ "rapid",
    channel_type =="S" ~ "step (small falls)",
    channel_type =="SC" ~ "side channel"
  )) |> 
  # creating new outputs for section column
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) |> 
  drop_na()