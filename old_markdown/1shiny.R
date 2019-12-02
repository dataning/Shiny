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


##%######################################################%##
#                                                          #
####                      Exercise                      ####
#                                                          #
##%######################################################%##


library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("My little Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
      code('install.packages("shiny")'),
      br(),
      br(),
      img(src = "https://www.dropbox.com/s/uyg8by7qe2621s6/rstudio.png?raw=1", height = 70, width = 200),
      br(),
      br(),
      "Shiny is a product of ", 
      span("RStudio", style = "color:blue")
    ),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from RStudio that makes it ", 
        em("incredibly easy "), 
        "to build interactive web applications with R."),
      br(),
      p("For an introduction and live examples, visit the ",
        a("Shiny homepage.", 
          href = "http://shiny.rstudio.com")),
      br(),
      h2("Features"),
      p("- Build useful web applications with only a few lines of code—no JavaScript required."),
      p("- Shiny applications are automatically 'live' in the same way that ", 
        strong("spreadsheets"),
        " are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
