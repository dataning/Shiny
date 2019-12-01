# Shiny's layout

Shiny app has two main parts and two minor parts. The two main parts are server and interface (UI). The two minor parts are initiating the shiny and linking up the two main parts.  

This is the most simple Shiny's skeleton as *app.R*:
```{r}
library(shiny)                          # Part 1 - loading the shiny package
ui <- fluidPage()                       # Part 2 - setting up the interface
server <- function(input, output) {}    # Part 3 - setting up the server side
shinyApp(ui = ui, server = server)      # Part 4 - knitting both sides together
```

For two separate files, *ui*.R will contain
```{r}
library(shiny)
shinyUI(fluidPage())
```

and *server.R* has
```{r}
library(shiny)
shinyServer(function(input, output) {})
```

## UI side

In the section of `fluidPage`, there're two main contributors - Input() and Output() functions. 
```{r}
 ui <- fluidPage(
  # *Input() functions,
  # *Output() functions
)
```

In addition, there's a layout option where we can rearrange where the shiny's input and outlook position. 

## inputs

Here is a list of all Input() functions avaliable: 
![](https://www.dropbox.com/s/05hqa0yhcky9y82/shiny_input_functions.png?raw=1)

This is how the Input() function works:
```{r}
sliderInput(inputId = "num", label = "Choose a number", ...)
```
- `inputId`: input name(internal use)
- `label`: label to display
- `.....`: input specific arguments

Here is one Input() function with `sliderInput()`. It offers a slider with a value bar between 1 and 100. 
```{r}
sliderInput(inputId = "num", 
label = "Choose a number", 
value = 25, min = 1, max = 100)
```

## outputs

Here is a list of all Output() functions avaliable: 
![](https://www.dropbox.com/s/y3bdznx2d68k0bu/shiny_output_functions.png?raw=1)

This is how the Output() function works:
```{r}
plotOutput("hist")
```
- `plotOutput`. This is where we decide which type of output to display. 
- `label`. This is the name given to the output object.

This is a simple Shiny app's Input() and Output() functions. 
```{r}
library(shiny)

ui <- fluidPage( 
    sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100), 
    plotOutput("hist")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
```
- `sliderInput`. Opt for a slider. 
- `inputId`: Give an unique id to the widget so that the server side knows how to access it. 
- `label`. Name "Choose a number".
- `value = 25, min = 1, max = 100)`. These are the input specific arguments or parameters. 
- `plotOutput("hist")`. Opt for a plot output with the object name called `hist`. 

**Attention**: While the Output() functions are placed in the UI component, it still needs to rebuild the output object on the server side. 

## Server side

This is the skeleton for server part.
```{r}
server <- function(input, output) {}
```

First, rebuild the Output() function's object from the UI part. The object was previously named as `hist`. In other words, `output$hist` is equivalent of `plotOutput("hist")`. 
```{r}
server <- function(input, output) {
    output$hist <- # code
}
```

Second, `renderYOUR_FUNCTION()` the output object. 
```{r}
server <- function(input, output) {
    output$hist <- renderPlot({ 
        hist(rnorm(100)) 
        }) 
}
```
- `output$hist`. The Output() function's object on the server side. 
- `renderPlot`. Pick renderYOUR_FUNCTION() depending on Output() function's object. 
- `hist(rnorm(100)`. Put down code block that builds the object.

Here is a list of all `renderYOUR_FUNCTION()`  functions avaliable:
![](https://www.dropbox.com/s/y3bdznx2d68k0bu/shiny_output_functions.png?raw=1)
