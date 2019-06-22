library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    locations <- eventReactive(input$recalc, {
        quakes[quakes$mag >= input$sliderMag[1]
               & quakes$mag <= input$sliderMag[2]
               & quakes$depth >= input$sliderDepth[1]
               & quakes$depth <= input$sliderDepth[2],1:2]
        }, ignoreNULL = FALSE)
    
    popup <- eventReactive(input$recalc, {
        paste(sep = "<br/>",
              paste0("<b>", "Earthquake #",
                     rownames(quakes[quakes$mag >= input$sliderMag[1]
                                     & quakes$mag <= input$sliderMag[2]
                                     & quakes$depth >= input$sliderDepth[1]
                                     & quakes$depth <= input$sliderDepth[2],]),
                     "</b>"),
              paste0("Magnitude: ", quakes$mag),
              paste0("Depth: ", quakes$depth)
        )
        }, ignoreNULL = FALSE)
    
    output$mymap <- renderLeaflet({

        leaflet() %>%
            addTiles() %>%
            addMarkers(data = locations(),
                       popup = popup(),
                       clusterOptions = markerClusterOptions())

    })

})