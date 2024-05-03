# install.packages("devtools")
# library(devtools)
# install_github("lgsilvaesilva/mapsBR")

library(mapsBR)
library(maptools)
data("regMun")
escolha <- paste(regMun$NOME, regMun$UF, sep = " - ")
cod_mun <- as.character(regMun$COD)
names(cod_mun) <- escolha

ui <- fluidPage(
  titlePanel(title = "Município Brasil"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "mun", 
                  label = "Município", 
                  choices = cod_mun, selected = c("Belo Horizonte - MG" = "3106200"))
    ),
  mainPanel(
    plotOutput("mapaMun")
  )
))

server <- function(input, output) {
  output$mapaMun <- renderPlot({
    mun.geo <- subset(regMun, COD == input$mun)
    class(mun.geo)
    plot(mun.geo)
  })
}

shinyApp(ui = ui, server = server)
