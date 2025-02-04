# UI Function
mod_debug_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Uploaded Dataset Information"),
    verbatimTextOutput(ns("upload_info"))
  )
}

# Server Function
mod_debug_server <- function(id, input_dataset) {
  moduleServer(id, function(input, output, session) {

    debug_info <- reactive({
      req(input_dataset())

      if(is.null(input_dataset())) {
        return("No data uploaded yet")
      } else {
        dataset_info <- input_dataset()

        return(dataset_info)
      }


    })

    output$upload_info <- renderPrint({
      debug_info()
    })

  })
}
