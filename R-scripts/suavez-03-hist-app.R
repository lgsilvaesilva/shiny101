library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Escolha um valor", 
              value = 500, min = 1, max = 1000, step = 25),
  sliderInput(inputId = "media", 
              label = "Escolha a média", 
              value = 20, min = 1, max = 100, step = 9),
  sliderInput(inputId = "desvio", 
              label = "Escolha o desvio-padrão", 
              value = 5, min = 1, max = 50, step = 4),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    titulo <- paste("Histograma com ", input$num, "observações")
    hist(rnorm(input$num, mean = input$media, sd = input$desvio), main = titulo, xlab = 'Valores', ylab = "Frequência", col = "gray80", cex = 1.5)
  })
}

shinyApp(ui = ui, server = server)