library(shiny)
library(readxl)

ui <- fluidPage(


  h2("Import Data"),

  fluidRow(
    column(6,
           wellPanel(width = 6,
                     h3("Upload Dataset"),
                     fileInput("upload_file",
                               label = "Choose file/s to upload (Supported file type is .xlsx only)",
                               multiple = TRUE,
                               buttonLabel = "Browse file/s...",
                               width = "400px",
                               accept = c(".csv", ".xlsx"))
                     )
           )
    ),

  hr(),

  fluidRow(
    column(10,
           wellPanel(
             h3("Load Data from Database"),
             textInput("server", label = "Server", value = NULL),
             textInput("db_name", label = "Database Name", value = NULL),
             passwordInput("sql_password", label = "Password"),
             textAreaInput("sql_query", label = "SQL Query", value = NULL, height = "100px"),
             actionButton("run_query", "Run")
             )
           )
    )

  )






server <- function(input, output, session){

  options(shiny.maxRequestSize = 30*1024^2)

  input_dataset <- reactive({
    req(input$upload_file)
    input$upload_file

  })


  #Debugging & Testing-----------------------------


  observe(
    print(input_dataset())
  )

}


shinyApp(ui, server)
