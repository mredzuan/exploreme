library(shiny)

# UI function for str module
strUI <- function(id) {
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("str_output"))
  )
}

# Server function for str module
strServer <- function(input, output, session, dataset) {
  output$str_output <- renderPrint({
    req(dataset())
    str(dataset())
  })
}
