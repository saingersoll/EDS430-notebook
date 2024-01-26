# load libaries ----
library(tidyverse)
library(palmerpenguins)


# filtering df for observations where body mass >= 3000 <= 4000 ----
body_mass_df <- penguins %>% 
  filter(body_mass_g %in% c(3000:4000))


# create scatterplot ----
ggplot(na.omit(penguins),
       aes(x = flipper_length_mm,
           y = bill_length_mm,
           color = species,
           shape = species)
       ) +
  geom_point() +
  scale_color_manual(values = c('darkorange', 'purple', 'cyan4')) +
  scale_shape_manual(values = c(19, 17, 15)) +
  labs(x = "Flipper length (mm)",
       y = "Bill length (mm)",
       color = 'Penguin Species',
       shape = "Penguin Species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = 'lightgrey')
        )
  
# building a data table ----
# year input ----


years_df <- penguins %>% 
  filter(year %in% c(2007:2008))

# create a datable without rownames
DT::datatable(years_df,
              options = list(pagelength = 10),
              rownames = FALSE
)
