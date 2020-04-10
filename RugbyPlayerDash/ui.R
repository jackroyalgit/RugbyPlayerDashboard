

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Rugby Analysis"),
  mainPanel(
    
    # Output: Tabset w/ plot, summary, and table ----
    tabsetPanel(type = "tabs",
                tabPanel("Player Database", DT::dataTableOutput("rugbydb")),
                tabPanel("Top 10 Plot", plotOutput("plot1"))
                )
    )
    
))
