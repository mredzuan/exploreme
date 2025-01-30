# Load libraries------------

library(shiny)
library(shinydashboard)

# Source the modules----------------
source("module/import_data_module.R")


#UI-------------------


ui <- dashboardPage(


  dashboardHeader(title = "ExploreMe App"),

  ## Sidebar Navigation -------------
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


  ## App Body ----------------
  dashboardBody(
    includeCSS("www/styles.css"),

    tabItems(
      ### Import Data UI--------------
      tabItem(tabName = "import_data",
             mod_import_data_ui("import_data")
      ),

      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)


# SERVER--------------------------------

server <- function(input, output) {


  ### Import Data Server -------------------
  datasets <- mod_import_data_server("import_data")


  #Debugging---------------

  observe({
    print(names(datasets()))
  })

}


shinyApp(ui, server)

