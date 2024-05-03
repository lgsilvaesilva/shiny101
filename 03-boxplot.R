library(shiny)

ui <- fluidPage(
  titlePanel(title = "Título do meu app 2"),
  sidebarLayout(
    sidebarPanel(
      numericInput(
        inputId = "n_amostra", 
        label = "Tamanho Amostral", 
        value = 20, 
        min = 1)
    ),
    mainPanel(
      plotOutput("box")
    )
  )
)

server <- function(input, output) {
  output$box <- renderPlot({
    amostra <- rnorm(n = input$n_amostra)
    boxplot(
      x = amostra, 
      col = "steelblue", 
      main = "Boxplot",
      xlab = "Dados")
  })
}

shinyApp(ui = ui, server = server)
