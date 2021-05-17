# Load libraries
library("dplyr")
library("plotly")
library("ggplot2")

# Open Data
HIV_df <- read.csv("../data/art_coverage_by_country_clean.csv", stringsAsFactors = FALSE,
         sep = "," )

View(HIV_df)

# Plot of estimated people receiving ART vs Estimated people living with HIV 
treatment_vs_sick <- plot_ly(
  data = HIV_df, 
  x = ~Reported.number.of.people.receiving.ART, 
  y = ~Estimated.number.of.people.living.with.HIV,
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    xaxis = list(autorange="reversed", title = "Estimated People Receiving Art"),
    yaxis = list(autorange="reversed", title = "Estimated People Living With HIV"),
    title = "Estimated People Receiving Art vs. Estimated People Living With HIV"
  )

# Make function that returns the plot 
Art_treated_vs_sick <- function(dataframe) {
  dataframe <- HIV_df
  return(plot_ly(
    data = HIV_df, 
    x = ~Reported.number.of.people.receiving.ART, 
    y = ~Estimated.number.of.people.living.with.HIV,
    type = "scatter",
    mode = "markers"
  ) %>%
    layout(
      xaxis = list(autorange="reversed", title = "Estimated People Receiving Art"),
      yaxis = list(autorange="reversed", title = "Estimated People Living With HIV"),
      title = "Estimated People Receiving Art vs. Estimated People Living With HIV"
    ))
}

Art_treated_vs_sick(dataframe)

# Description 
# This scatter plot displays the trend of of how the estimated number people living
# with HIV is impacted as the number of people receiving art increases. There is
# an overall linear, positive trend with variation. 


