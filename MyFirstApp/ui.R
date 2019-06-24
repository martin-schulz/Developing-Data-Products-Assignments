library(shiny)
library(leaflet)

shinyUI(fluidPage(

    titlePanel("Locations of Earthquakes off Fiji"),
    
    headerPanel(h5("The data set give the locations of 1000 seismic events of 
                   MB > 4.0. The events occurred in a cube near Fiji since 
                   1964.")),

    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderMag", "Pick range of magnitudes (RM) to display",
                        4.0, 6.4, value = c(4.0,6.4), step = 0.1),
            sliderInput("sliderDepth", "Pick range of depths (km) to display",
                        40, 680, value = c(40,680), step = 1),
            actionButton("recalc", "Submit")
        ),

        mainPanel(
            leafletOutput("mymap")
        )
    ),
    
    wellPanel(
        HTML("<div id=\"map-controls\" class=\"section level3\">
        <h3>Map controls</h3>
        <ul>
        <li><p>By default, all 1,000 earthquakes are displayed on the map.</p>
        </li>
        <li><p>Areas with multiple earthquakes are shown as clusters with the 
        label showing how many earthquakes occured in that area.</p></li>
        <li><p>Using the zoom controls (“+” and “-” buttons in the top left 
        corner) or clicking on any cluster will zoom the map, splitting clusters
        into smaller clusters or single markers, depending on the zoom level.
        </p></li>
        <li>Clicking on a marker shows the following information:
        <ul>
        <li>Record number in earthquake data set</li>
        <li>Richter Magnitude</li>
        <li>Depth in km</li>
        </ul></li>
        </ul>
        </div>
        <div id=\"slider-controls\" class=\"section level3\">
        <h3>Slider controls</h3>
        <ul>
        <li>The number of earthquakes displayed on the map can be restricted by 
        two mterics using the slider controls on the left-hand side:
        <ul>
        <li>Magnitude</li>
        <li>Depth</li>
        </ul></li>
        <li>Please select the lower and upper limits of each metric by dragging 
        the slider controls to the desired values, then click the “Submit” 
        button to apply your selection.</li>
        </ul>
        </div>"
        )
    )
))
