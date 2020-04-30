library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  "then x times 5 is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({ 
    x * 5
  })
}

# Almost every output you’ll write in Shiny will follow this same pattern:

#output$ID <- renderTYPE({
# Expression that generates whatever kind of output
# renderTYPE expects
#})

# Connect both as a shiny app
shinyApp(ui, server)
