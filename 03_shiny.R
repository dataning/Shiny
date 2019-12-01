library(shiny)

ui <- fluidPage(
  fluidRow(
    column(4,
      wellPanel(
        sliderInput("obs", "Number of observations:",  
                  min = 1, max = 1000, value = 500)
      )
    ),
    column(8,
           plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
    renderPlot({
    distPlot(rnorm(obs))
  })
}

shinyApp(ui = ui, server = server)