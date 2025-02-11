#TO DO-------
# Explore different method to handle imported considering data persistence upon multiple file uploaded

options(shiny.reactlog=TRUE)
#options(shiny.fullstacktrace=TRUE)


# Load libraries------------

library(shiny)
library(shinydashboard)
library(DT)
library(fresh)

# Source the functions & modules----------------
source("function/fresh_theme.R")
source("module/import_data_module.R")
source("module/imported_data_obj_view_module.R")





source("module/debugging_module.R")


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
      menuItem("Machine Learning Insights", tabName = "ml_insights", icon = icon("cogs")),
      hr(),
      menuItem("Debugging", tabName = "debugging", icon = icon("bug"))
    )
  ),


  ## App Body ----------------
  dashboardBody(
    #includeCSS("www/styles.css"),

    use_theme(mytheme),

    #bookmarkButton(),

    tabItems(
      ### Import Data UI--------------
      tabItem(tabName = "import_data",
             mod_import_data_ui("import_data")
             ),

      tabItem(tabName = "imported_data",

              mod_import_data_obj_view_ui("imported_data_obj")

              ),

      ### Debugging tab content------------------
      tabItem(tabName = "debugging",
              h2("Place holder for debugging purposes"),

              mod_debug_ui("debug_module")
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
  input_dataset <- mod_import_data_server("import_data")


  ### Imported Data Object View Server -------------------
  mod_import_data_obj_view_server("imported_data_obj", input_dataset)


  #Debugging---------------

  mod_debug_server("debug_module", input_dataset)

  observe({
    print(input_dataset())
  })

  observe({
    print(seq_len(nrow(input_dataset())))
  })

  }


shinyApp(ui, server)

