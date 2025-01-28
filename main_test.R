library(shiny)

# Source the modules
source("module_test/module_str.R")
source("module_test/module_summary.R")

# Define UI
ui <- fluidPage(
  titlePanel("Modular Shiny App"),

  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV File",
                accept = c(".csv")),
      br(),
      actionButton("view_str", "View Structure"),
      actionButton("view_summary", "View Summary")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Dataset Structure", strUI("str_module")),
        tabPanel("Dataset Summary", summaryUI("summary_module"))
      )
    )
  )
)

# Define Server
server <- function(input, output, session) {

  # Increase file upload size limit to 30 MB
  options(shiny.maxRequestSize = 30 * 1024^2)

  # Reactive to store the uploaded dataset
  dataset <- reactive({
    req(input$file)
    read.csv(input$file$datapath)
  })

  # Call modules
  callModule(strServer, "str_module", dataset)
  callModule(summaryServer, "summary_module", dataset)
}

# Run the app
shinyApp(ui = ui, server = server)
