# user interface ----
ui <- navbarPage(
  
  title = "LTR Animal Dats Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(
    
    title = "About this Page",
    
    # we can add general txt within tabPanel like so
    "background info goes here"
    
  ),  # END (page 1) intro tabPanel
  
  # (Page 2) data vis tabPanel
  tabPanel(
    
    title = "Explore the Data",
    
    "inputs and outputs live here"
    
  ) # END (Page 2) data vis tabPanel
  
) # END navbarPage