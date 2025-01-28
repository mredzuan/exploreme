library(shiny)

# UI function for summary module
summaryUI <- function(id) {
  ns <- NS(id)
  tagList(
    verbatimTextOutput(ns("summary_output"))
  )
}

# Server function for summary module
summaryServer <- function(input, output, session, dataset) {
  output$summary_output <- renderPrint({
    req(dataset())
    summary(dataset())
  })
}
