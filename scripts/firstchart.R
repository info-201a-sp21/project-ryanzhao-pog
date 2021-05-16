# Loading Libraries
library("dplyr")
library("plotly")
library("ggplot2")
library("leaflet")

# Read the data from the csv file
hiv_df <- read.csv("../data/art_coverage_by_country_clean.csv",
  stringsAsFactors = FALSE
)
country_coordinates <- read.csv("../data/world_country_coordinate.csv",
  stringsAsFactors = FALSE
)

combined_data <- merge(hiv_df, country_coordinates,
  by = "Country",
  all.x = TRUE
)

# Turning column in numeric values
filtered_hiv$art_received <-
  as.numeric(filtered_hiv$Reported.number.of.people.receiving.ART)

# Filtering Columns to show only countries with data in reported number of
# people receiving ART.
filtered_hiv <- filter(combined_data, art_received != "Nodata")

# Combining columns for information
content <- paste(
  sep = "<br/>",
  filtered_hiv$Country,
  filtered_hiv$art_received
)

# Interactive Geographical Plot for Reported number of People Receiving Art
geographic_plot_art <- leaflet(data = filtered_hiv) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircles(
    lng = ~Longitude,
    lat = ~Latitude,
    stroke = TRUE,
    weight = 1,
    fillOpacity = 0.3,
    color = "Red",
    radius = ~ sqrt(art_received) * 600,
    popup = content
  )

geographic_plot_art

# Description
# This is an interactive geographical visualization for the reported number
# of people receiving ART. You can see which country has the most number of
# people receiving the treatment based on the size of the circles. When
# the circle is clicked, it will show the user the country and the exact
# number of people who received the treatment.
