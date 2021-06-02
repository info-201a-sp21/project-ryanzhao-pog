# Load Libraries
library("dplyr")
library("ggplot2")
library("shiny")
library("plotly")
 
#data
hiv_df <- read.csv("../data/art_coverage_by_country_clean.csv",
                   stringsAsFactors = FALSE
)

bar_chart_df <- hiv_df %>%
  group_by(WHO.Region) %>%
  select(Country, WHO.Region,
         Estimated.ART.coverage.among.people.living.with.HIV...._median) %>%
  filter(Estimated.ART.coverage.among.people.living.with.HIV...._median
         != "NA") %>%
  rename(M_ART_coverage_among_living_HIV =
           Estimated.ART.coverage.among.people.living.with.HIV...._median)


# Server Function
server <- function(input, output) {
  output$region_chart <- renderPlotly({
    chart <- plot_ly(
      data = bar_chart_df,
      x = ~bar_chart_df$Country[bar_chart_df$WHO.Region == input$regionselect],
      y = ~bar_chart_df$M_ART_coverage_among_living_HIV[bar_chart_df$WHO.Region
                                                        == input$regionselect],
      Type = "bar"
    ) %>%
      layout(
        xaxis = list(title = "Country"),
        yaxis = list(title = "ART Coverage among People with HIV")
      )
    return(chart)
  })
}

# UI
ui <- tabPanel(
  "Page one",
  h1(strong("Select a Region")),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "regionselect",
                  label = "Region",
                  selected = "Americas",
                  choices = unique(bar_chart_df$WHO.Region)
      )
    ),
    mainPanel(
      h2("Regional Median Estimated ART Coverage Among People Living with HIV"),
      plotlyOutput(outputId = "region_chart")
    )
  ))

# app
# Create shiny app
shinyApp(ui = ui, server = server)
