library(shiny)
library(shinyjs)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  useShinyjs(),
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
    
    tabsetPanel(id = "tabs", 
                tabPanel(value = "1",title = "Player Database", DT::dataTableOutput("rugbydb")),
                tabPanel(value = "2", title ="Top 10 Plot", plotOutput("plot1"))
    
  
  )
    
)))
