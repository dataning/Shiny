library(shiny)
library(ggplot2)
#ui.R
ui <- fluidPage(
  titlePanel("My shiny app"), sidebarLayout(
    sidebarPanel(
      helpText("This app shows how a user can upload a csv file. Then, plot the data.
          Any file can be uploaded but analysis is only available
          if the data is in same format as the sample file, downloadable below
          "),
      a("Data to be plotted", href="https://www.dropbox.com/s/t3q2eayogbe0bgl/shiny_data.csv?dl=0"),
      tags$hr(),
      fileInput("file","Upload the file"), 
      h5(helpText("Select the read.table parameters below")),
      checkboxInput(inputId = 'header', label = 'Header', value = TRUE),
      checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
      br(),
      radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), selected = ',')
    ),
    mainPanel(
      uiOutput("tb"),
      plotOutput("line")             
    )
  )
)

#server.R
server <- function(input,output){
  data <- reactive({
    
    
    file1 <- input$file
    if(is.null(file1)){return()} 
    
    read.table(file=file1$datapath, sep=input$sep, header = input$header, stringsAsFactors = input$stringAsFactors)})
  
  output$filedf <- renderTable({
    if(is.null(data())){return ()}
    input$file
  }) 
  
  output$sum <- renderTable({
    if(is.null(data())){return ()}
    summary(data())
  })
  
  output$table <- renderTable({
    if(is.null(data())){return ()}
    data()
  })
  
  output$line <- renderPlot({
    if (is.null(data())) { return() }
    print(ggplot(data(), aes(x=date, y=aa)) + geom_line()+ facet_wrap(~station)) })
  
  output$tb <- renderUI({if(is.null(data()))
    h5()               
    else
      tabsetPanel(tabPanel("About file", tableOutput("filedf")),tabPanel("Data", tableOutput("table")),tabPanel("Summary", tableOutput("sum")))
  })
}


shinyApp(ui = ui, server = server)