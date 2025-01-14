library(shiny)
library(shiny.fluent)
library(DT)  # Load the DT package

# Define UI for application
title <- Text("Shiny Fluent App with Common Widgets", variant = "xxLarge")

ui <- fluentPage(
  title,
  Pivot(
    PivotItem(
      headerText = "Inputs",
      Stack(
        tokens = list(childrenGap = 10),
        TextField(label = "Text Input", placeholder = "Enter text here"),

        column(3,

               Dropdown(
                 label = "Dropdown",
                 options = list(
                   list(key = "A", text = "Option A"),
                   list(key = "B", text = "Option B"),
                   list(key = "C", text = "Option C")
                 )
               )

               ),


        Slider(
          label = "Slider",
          min = 0,
          max = 100,
          step = 1,
          defaultValue = 50
        ),
        Checkbox(label = "Checkbox"),
        ChoiceGroup(
          label = "Radio Buttons",
          options = list(
            list(key = "1", text = "Choice 1"),
            list(key = "2", text = "Choice 2"),
            list(key = "3", text = "Choice 3")
          )
        )
      )
    ),
    PivotItem(
      headerText = "Outputs",
      Stack(
        tokens = list(childrenGap = 10),
        Text("Selected Text:"),
        Text("Selected Dropdown:"),
        Text("Slider Value:"),
        Text("Checkbox Checked:"),
        Text("Selected Radio Button:"),
        Text("Table Output"),
        DT::dataTableOutput("table"),  # Use DT::dataTableOutput
        plotOutput("plot")
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  output$table <- DT::renderDataTable({  # Use DT::renderDataTable
    head(mtcars)
  })

  output$plot <- renderPlot({
    plot(mtcars$mpg, mtcars$cyl, main = "Mtcars Plot", xlab = "Miles Per Gallon", ylab = "Cylinders")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
