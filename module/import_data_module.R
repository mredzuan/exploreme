mod_import_data_ui <- function(id){

  ns <- NS(id)

  tagList(

    h2("Import Data"),

    fluidRow(
      column(6,
             wellPanel(width = 6,
                       h3("Upload Dataset"),
                       fileInput(ns("upload_file"),
                                 label = "Choose file/s to upload (Supported file type is .csv & .xlsx only)",
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
               textInput(ns("server"), label = "Server", value = NULL),
               textInput(ns("db_name"), label = "Database Name", value = NULL),
               passwordInput(ns("sql_password"), label = "Password"),
               textAreaInput(ns("sql_query"), label = "SQL Query", value = NULL, height = "100px"),
               actionButton(ns("run_query"), "Run")
             )
      )
    )

  )
}


mod_import_data_server <- function(id) {

  moduleServer(id, function(input, output, session) {

    options(shiny.maxRequestSize = 30*1024^2)

    datasets <- reactive({
      req(input$upload_file)

      uploaded_files <- input$upload_file

      file_list <- lapply(uploaded_files$datapath, function(path) {
        ext <- tools::file_ext(path)
        if (ext == "csv") {
          read.csv(path)
        } else if (ext == "xlsx") {
          read_excel(path)
        } else {
          return(NULL)
        }

      })

      names(file_list) <- input$upload_file$name
      return(file_list)

    })

  })
}
