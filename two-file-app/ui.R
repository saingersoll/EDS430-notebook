ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info will go here" # REPLACE THIS WITH CONTENT
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Animal Data Explorer",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE),  # adds select all or deselect all option
                                      multiple = TRUE                              # allows users to select multiple options at once
                                      ) # END channel type pickerInput
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          "trout plot output goes here" # REPLACE THIS WITH CONTENT
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel 
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          "penguin plot input(s) go here" # REPLACE THIS WITH CONTENT
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin plot output goes here" # REPLACE THIS WITH CONTENT
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage
