# TO DO
# To refactor the code due to display message when no data is imported

mod_import_data_obj_view_ui <- function(id) {

  ns <- NS(id)

  tagList(

    h2("Imported File Information"),
    br(),
    uiOutput(ns("file_info_ui"))

  )
}



mod_import_data_obj_view_server <- function(id, input_dataset){
  moduleServer(id, function(input, output, session) {

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
        DT::dataTableOutput(session$ns("object_info_table"))
      }
    })



    output$object_info_table <- renderDataTable({
      object_info()
    }, options = list(pageLength = 5, autowidth = TRUE))


  })
}

