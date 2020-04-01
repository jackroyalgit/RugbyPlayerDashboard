library(shiny)
library(DT)
library(dplyr)

#Interactive player data table - acts as a database of sorts


rugby <- read.csv("RugbyPlayerDataESPN.csv")

server <- function(input, output) {
    output$rugbydb <- renderDT({
        rdb <- rugby %>% arrange(-Mat)
        
        datatable(
                rdb,
                filter = "top",
                class = "display nowrap compact",
                options = list(scrollX = TRUE,
                               searching = TRUE)
            )
        
        
    })
}


