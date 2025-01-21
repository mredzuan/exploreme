#Load library-----

library(shiny)


# UI----------

ui <- fluidPage(
  h2("Import Data"),

  fluidRow(
    div(
      column(12,
             h4("File Input"),
             fileInput("upload", NULL, accept = c(".csv", ".xlsx", ".PDF"))
             )

    )
  )

)


# SERVER-------

server <- function(input, output){

  data <- reactive({
    req(input$upload)


    })

  observe({
    req(input$upload)
    print(input$upload)
  })

}


shinyApp(ui = ui, server = server)

