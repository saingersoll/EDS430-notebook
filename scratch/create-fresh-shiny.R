library(fresh)

fresh::create_theme(
  
  theme = 'default',
  
  bs_vars_global(
    
    body_bg = "violet",
    text_color = 'tan',
    link_color = "white"
  ),
  
  bs_vars_navbar(
    
    default_bg = 'plum',
    default_color = 'hotpink'
    
  ),
  
  bs_vars_tabs(
    
    border_color = 'gold',
    
  ),
  
  output_file = 'redo-two-file-app/www/shiny-fresh-theme.css'
  
)
