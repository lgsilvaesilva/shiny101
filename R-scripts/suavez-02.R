library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "num", 
    label = "Escolha um valor", 
    value = 25, min = 1, max = 100
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

