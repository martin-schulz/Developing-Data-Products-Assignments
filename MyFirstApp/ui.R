library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Locations of Earthquakes off Fiji"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderMag", "Pick range of magnitudes (RM) to display",
                        4.0, 6.4, value = c(4.0,6.4), step = 0.1),
            sliderInput("sliderDepth", "Pick range of depths (km) to display",
                        40, 680, value = c(40,680), step = 1),
            actionButton("recalc", "Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h5("The events occurred in a cube near Fiji since 1964."),
            leafletOutput("mymap")
        )
    )
))
