#Loading Libraries
library("dplyr")
library("plotly")
library("ggplot2")
library("leaflet")

# Read the data from the csv file
hiv_df <- read.csv("../data/art_coverage_by_country_clean.csv",
                   stringsAsFactors = FALSE)
country_coordinates <- read.csv("../data/world_country_coordinate.csv", 
                   stringsAsFactors = FALSE)

combined_data <- merge(hiv_df, country_coordinates, by = "Country", 
                       all.x = TRUE)

# Filtering Columns to show only countries with data in reported number of
# people receiving ART.
filtered_hiv <- filter(combined_data, Reported.number.of.people.receiving.ART 
               != "Nodata")

# Turning column in numeric values
sapply(filtered_hiv, class)

filtered_hiv$Reported.number.of.people.receiving.ART <-
  as.numeric(filtered_hiv$Reported.number.of.people.receiving.ART)

sapply(filtered_hiv, class)

# Combining columns for information
content <-  paste(sep = "<br/>",
                  filtered_hiv$Country,
                  filtered_hiv$Reported.number.of.people.receiving.ART)

#Interactive Geographical Plot for Reported number of People Receiving Art
geographic_plot_ART <- leaflet(data = filtered_hiv) %>%
  addProviderTiles("CartoDB.Positron") %>% 
  addCircles(
    lng = ~Longitude,
    lat = ~Latitude,
    stroke = TRUE,
    weight = 1,
    fillOpacity = 0.3,
    color = "Red",
    radius = ~sqrt(Reported.number.of.people.receiving.ART) * 600,
    popup = content
  )

geographic_plot_ART
