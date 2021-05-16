# Load libraries
library("dplyr")
library("plotly")
library("ggplot2")

# New CSV file 
Art_by_country_subset = HIV_df[,c(1,2,3,4,11)]
write.csv(Art_by_country_subset, "data/Art_by_country_subset.csv",
          row.names = FALSE)
View(Art_by_country_subset)

# Open Data
HIV_df <- read.csv("data/Art_by_country_subset.csv", stringsAsFactors = FALSE,
         sep = "," )
View(HIV_df)

# Plot of estimated people receiving ART vs Estimated people living with HIV 
trestment_vs_sick <- plot_ly(
  data = HIV_df, 
  x = ~Reported.number.of.people.receiving.ART, 
  y = ~Estimated.number.of.people.living.with.HIV,
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    xaxis = list(autorange="reversed"),
    yaxis = list(autorange="reversed"),
    title = "Estimated People Receiving Art vs. Estimated People Living With HIV",
    xaxis = list(title = "Estimated People Receiving Art"),
    yaxis = list(title = "Estimated People Living With HIV")
  )

# Description 
# This scatter plot displays the trend of of how the estimated number people living
# with HIV is impacted as the number of people receiving art increases. There is
# an overall linear, positive trend with variation. 


