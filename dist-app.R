ui <- fluidPage(
  titlePanel(title = "Simula"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "dist", 
                  label = "Escolha a distribuição", 
                  choices = c("Normal", "Exponencial")),
      
      numericInput(inputId = "n_amostra", 
                   label = "Tamanho Amostral", 
                   value = 20, 
                   min = 1),
      
      textInput(inputId = "titulo", 
                value = "Histograma",
                label = "Titulo"
      ),
      
      radioButtons(inputId = "colors", 
                   label = "Cor do histograma", 
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
  
  amostra <- reactive({
    geraValor <- switch(input$dist, 
           "Normal" = rnorm,
           "Exponencial" = rexp)
    geraValor(n = input$n_amostra)
  })
  
  output$box <- renderPlot({
    hist(x = amostra(), col = input$colors, 
            main = input$titulo,
            xlab = "Dados")
  })
}

shinyApp(ui = ui, server = server)
