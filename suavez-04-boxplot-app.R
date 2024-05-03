ui <- fluidPage(
  titlePanel(title = "Título do meu app 2"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "n_amostra", 
                   label = "Tamanho Amostral", 
                   value = 20, 
                   min = 1),
      textInput(inputId = "titulo", 
                value = "Boxplot",
                label = "Titulo"
      ),
      radioButtons(inputId = "colors", 
                   label = "Cor do boxplot", 
                   choices = list( "Vermelho" = "#ED665D",  
                                   "Verde" = "#67BF5C")),
      submitButton(text = "Aplicar!")
    ),
    mainPanel(
      plotOutput("box")
    )
  )
)

server <- function(input, output) {
  output$box <- renderPlot({
    amostra <- rnorm(n = input$n_amostra)
    boxplot(x = amostra, col = input$colors, 
            main = input$titulo,
            xlab = "Dados")
  })
}

shinyApp(ui = ui, server = server)
