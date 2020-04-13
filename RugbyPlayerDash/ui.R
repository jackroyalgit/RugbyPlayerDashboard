

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Rugby Analysis"),
  
    
    # Output: Tabset w/ plot, summary, and table ----

  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Number of observations:",
                  value = 10,
                  min = 1,
                  max = 100)
      
    
      
    ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Player Database", DT::dataTableOutput("rugbydb")),
                tabPanel("Top 10 Plot", plotOutput("plot1"))
    )
  )
  )
    
))
