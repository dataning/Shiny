# Package
library(shiny)

# Layout

ui <- fluidPage(
  titlePanel("Bradford Data Education"), 
  sidebarLayout(position = "right", # default is on the left
    sidebarPanel(
      sliderInput(
        "obs", "Number of observations:",
        min = 1, max = 1000, value = 600)
      ),
    mainPanel(plotOutput("distPlot")
    )
  )
)

# Server
server <- function(input, output) {
  
}

# Tie
shinyApp(ui = ui, server = server)

##%######################################################%##
#                                                          #
####                    wellPanel()                     ####
#                                                          #
##%######################################################%##

# Package
library(shiny)

# Layout

ui <- fluidPage(
  titlePanel("Is this better?"),
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

# Server
server <- function(input, output) {
  
}

# Tie
shinyApp(ui = ui, server = server)

##%######################################################%##
#                                                          #
####                      Wording                       ####
#                                                          #
##%######################################################%##


# Package
library(shiny)

# Layout

ui <- fluidPage(
  titlePanel("My Star Wars App"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h6("Episode IV", align = "center"),
      h6("A NEW HOPE", align = "center"),
      h5("It is a period of civil war.", align = "center"),
      h4("Rebel spaceships, striking", align = "center"),
      h3("from a hidden base, have won", align = "center"),
      h2("their first victory against the", align = "center"),
      h1("evil Galactic Empire.")
    )
  )
)

# Server
server <- function(input, output) {
  
}

# Tie
shinyApp(ui = ui, server = server)
