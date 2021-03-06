library(shiny)
library(DT)
library(dplyr)
library(ggthemes)
library(ggplot2)

rugby <- read.csv("RugbyPlayerDataESPN1.csv")

server <- function(input, output) {
    
    #Interactive player data table - acts as a database of sorts
    output$rugbydb <- renderDT({
        rdb <- rugby %>% arrange(-Mat)
        
        datatable(
                rdb,
                filter = "top",
                class = "cell-border stripe",
                options = list(scrollX = TRUE,
                               searching = TRUE)
            )
        
        
    })
    observeEvent(input$tabs, {
        if(input$tabs == "2"){
            show("n")
            show("teams")
        }else{
            hide("n")
            hide("teams")
        }
    })
    output$plot1 <- renderPlot({
        #could have like 4 plots each with a different attribute
        number <- input$n
        team <- input$teams
        Top10 <- rugby %>% filter(Team == team) %>% top_n(number, Mat)
        p <- ggplot(Top10, aes(x = reorder(Player,-Mat,sum),y = Mat)) + geom_bar(stat = "identity")
        p + theme_wsj()+ scale_colour_wsj("colors6") +
            ggtitle(paste0("Top ", input$n ," players from ", Top10$Team," by number of Pts")) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
    })
        
}


