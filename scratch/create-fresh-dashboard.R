library(fresh)

create_theme(
  
  adminlte_color(
    
    light_blue = 'plum'
    
  ),
  
  adminlte_global(
    
    content_bg = 'pink'
    
  ),
  
  adminlte_sidebar(
    
    width = '400px',
    dark_bg = 'tan',
    dark_hover_bg = 'violet',
    dark_color = 'magenta'
    
  ),
  
  output_file = 'shinydashboard/www/dashboard-fresh-theme.css'
)

