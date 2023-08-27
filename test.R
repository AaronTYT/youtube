library(shiny)
library(leaflet)
library(sf)

# Load the data
countries <- sf::st_read("https://rstudio.github.io/leaflet/json/countries.geojson")

# Define UI
ui <- fluidPage(
  titlePanel("World Map with GDP Visualization"),
  leafletOutput("map")
)

# Define server logic
server <- function(input, output) {
  output$map <- renderLeaflet({
    print(class(countries))
    
    # Datatype for countries$gdp_md_est is numeric
    print(paste("datatype: ", class(countries$gdp_md_est)))
    print(head(countries$gdp_md_est), 3)
    pal <- colorNumeric(
      palette = "Blues",
      # The datatype must be numeric to perform this action.
      domain = countries$gdp_md_est
    )
    
    qpal <- colorQuantile("Blues", countries$gdp_md_est, n = 7)
    
    leaflet() %>%
      addTiles() %>%
      addPolygons(
        data = countries,
        stroke = FALSE,
        smoothFactor = 0.2,
        fillOpacity = 1,
        fillColor = ~pal(gdp_md_est),
        popup = ~paste("<strong>Country:</strong><br>",
                       "<strong>GDP:</strong>", gdp_md_est)
      )
  })
}



# Create and run Shiny app
shinyApp(ui, server)
