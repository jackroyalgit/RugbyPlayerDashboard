

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    h2("Player_DB"),
    DT::dataTableOutput("rugbydb")
))
