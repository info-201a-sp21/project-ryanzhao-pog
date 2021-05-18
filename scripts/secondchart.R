# Load libraries
library("dplyr")
library("plotly")
library("ggplot2")

# Make function that returns the plot 
Art_treated_vs_sick <- function(dataframe) {
  return(plot_ly(
    data = dataframe, 
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

# Description 
# This scatter plot displays the trend of of how the estimated number people living
# with HIV is impacted as the number of people receiving art increases. There is
# an overall linear, positive trend with variation. 


