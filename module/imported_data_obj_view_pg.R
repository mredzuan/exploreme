library(shiny)
library(readxl)
library(DT)

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
  ),

  fluidRow(
    column(12,
           h3("Imported File Information"),
           uiOutput("file_info_ui")
           )

  )

)






server <- function(input, output, session){

  options(shiny.maxRequestSize = 30*1024^2)

  input_dataset <- reactive({
    #req(input$upload_file)
    input$upload_file

  })


  object_info <- reactive({

    #req(input_dataset())

    df <- input_dataset()
      data.frame(
        `File Name` = df$name,
        `Size (KB)` = round(df$size / 1024, 2),
        `Type` = df$type,
        stringsAsFactors = FALSE
      )

  })

  output$file_info_ui <- renderUI({


    if (is.null(object_info())) {
      tags$p("Nothing to display, please import a dataset!",
             style = "color: red; font-weight: bold;")
    } else {
      DT::dataTableOutput("object_info_table")
    }
  })


  output$object_info_table <- renderDataTable({
    object_info()
  }, options = list(pageLenght = 5, autowidth = TRUE))


  #Debugging & Testing-----------------------------


  observe(
    print(input_dataset())
  )

}


shinyApp(ui, server)
