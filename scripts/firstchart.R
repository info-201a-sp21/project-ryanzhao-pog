#Loading Libraries
library("dplyr")
library("plotly")
library("ggplot2")
library("leaflet")

# Read the data from the csv file
hiv_df <- read.csv("../data/art_coverage_by_country_clean.csv",
                   stringsAsFactors = FALSE, sep = ",")
country_coordinates <- read.csv("../data/world_country_coordinate.csv", 
                   stringsAsFactors = FALSE, sep = ",")
View(hiv_df)

combined_data <- merge(hiv_df, country_coordinates, by = "Country", all.x = TRUE)

#Plot
leaflet(data = combined_data) %>% 
  addProviderTiles("CartoDB.Positron") %>% 
  addCircles(
    lat = ~Latitude,
    lng = ~Longitude,
    stroke = FALSE,
    popup = ~Reported.number.of.people.receiving.ART
  )
