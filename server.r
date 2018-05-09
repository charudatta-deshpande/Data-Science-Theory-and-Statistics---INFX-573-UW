library(shiny)
library(choroplethr)
library(choroplethrMaps)
library(markdown)

# the state and county demographics are in these two data.frames. 
# first column is a list of regions. each subseqent column is a value
data(df_state_demographics , package="choroplethr", envir=environment())
data(df_county_demographics, package="choroplethr", envir=environment())

title_first_part = "5-Year American Community Survey (2013):   "

shinyServer(function(input, output) {
  
  # render the state choropleth map
  output$map_output = renderPlot({
    
    # prepare the data
    title                       = paste0(title_first_part, input$demographic, 
                                         " - ", input$choice)
    choice                      = input$choice
    df_state_demographics$value = df_state_demographics[, input$demographic]
    # add a progress bar
    if (choice == "State") {
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating image. Please wait.", value = 0)
    
    # render
    state_choropleth(df_state_demographics, 
                     title      = title)
    } else {
    # prepare the data
      title                       = paste0(title_first_part, input$demographic, 
                                           " - ", input$choice)
    choice                       = input$choice
    df_county_demographics$value = df_county_demographics[, input$demographic]
  
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating image. Please wait.", value = 0)
    
    # render
    county_choropleth(df_county_demographics, title=title)
    }
  })
})