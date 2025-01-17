# Load libraries------------

library(shiny)
library(shinydashboard)


#UI-------------------


ui <- dashboardPage(


  dashboardHeader(title = "ExploreMe App"),

  ## Navigation Sidebar-------------
  dashboardSidebar(
    sidebarMenu(
      menuItem("Import Data", tabName = "import_data", icon = icon("file-import")),
      menuItem("Imported Data Object", tabName = "imported_data", icon = icon("file")),
      menuItem("Data Overview Summary", tabName = "data_summary", icon = icon("table")),
      menuItem("Visual Exploration", tabName = "data_exploration", icon = icon("chart-simple")),
      menuItem("Text Analytics", tabName = "text_analytics", icon = icon("spell-check")),
      menuItem("Anomaly Detection", tabName = "anomaly_detection", icon = icon("magnifying-glass-chart")),
      menuItem("Machine Learning Insights", tabName = "ml_insights", icon = icon("cogs"))
    )
  ),


  ## Body of Dashboard----------------
  dashboardBody(
    includeCSS("www/styles.css"),

    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),

                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),

      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)


server <- function(input, output) {

}


shinyApp(ui, server)

