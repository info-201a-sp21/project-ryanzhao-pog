library("dplyr")
library("plotly")

# Read the data from the csv file
art_coverage_df <- read.csv("../data/art_coverage_by_country_clean.csv")
colnames(art_coverage_df)

# Isolate into columns that we are interested in
data_for_plot <- art_coverage_df %>% 
  group_by(WHO.Region) %>% 
  select(WHO.Region, Estimated.number.of.people.living.with.HIV_median) %>% 
  summarize(total_median_num_HIV = 
              sum(Estimated.number.of.people.living.with.HIV_median, 
                  na.rm = TRUE))

# Plot of the Estimated Number of People living with HIV per each WHO recognized
# region of the world
plot_hiv_per_region <- plot_ly(
  data = data_for_plot,
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

plot_hiv_per_region

# Description
# This bar graph displays the median estimate of the number of people who are
# living with HIV per WHO Region. The African region has by far the most number
# of people who are living with HIV, which indicates what region needs the most
# assistance and care with ART coverage.