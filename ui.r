library(shiny)
#
shinyUI(fluidPage(
  
  titlePanel("US Demographic Data - 2013 (State/County)"),
  
  sidebarLayout(
    sidebarPanel(      
      selectInput("demographic", label= h3("Select Your Parameter"), 
                  list("Total Population" = "total_population", 
                      "Percent White" = "percent_white",
                      "Percent Black" = "percent_black",
                      "Percent Asian" = "percent_asian",
                      "Percent Hispanic" = "percent_hispanic")),
      
      radioButtons("choice",label=h3("Choose State or County Level Map:"),
                   choices = list("County" = "County", 
                                  "State" = "State"),selected = "County")      
    ),
    
    mainPanel(
      plotOutput("map_output")
    )
  )
))