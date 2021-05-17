library("dplyr")
library("plotly")

# Read the data from the csv file
art_coverage_df <- read.csv("../data/art_coverage_by_country_clean.csv")

# Isolate into columns that we are interested in
data_for_plotting <- function(dataset) {
  dataset %>% 
  group_by(WHO.Region) %>% 
    select(WHO.Region, Estimated.number.of.people.living.with.HIV_median) %>% 
    new_df <- mutate(total_median_num_HIV = 
                sum(Estimated.number.of.people.living.with.HIV_median, 
                    na.rm = TRUE)) %>% 
    plot_ly(
      x = ~WHO.Region,
      y = ~total_median_num_HIV, 
      type = "bar", 
      name = "Number w/ HIV"
    ) %>% 
      layout(
        title = "Estimated Number of People Living with HIV vs Region of the World",
        xaxis = list(title = "Region of the World"),
        yaxis = list(title = "Median Estimate of People Living with HIV"),
        barmode = "group"
      )
}
data_for_plotting(art_coverage_df)
# Description
# This bar graph displays the median estimate of the number of people who are
# living with HIV per WHO Region. The African region has by far the most number
# of people who are living with HIV, which indicates what region needs the most
# assistance and care with ART coverage.