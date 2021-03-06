# Shiny's layout

Shiny app has four individual parts: head, two parts of the body and tail. The two parts contributing to the body are _server_ and _interface (UI)_. The head is where the shiny package gets intitated and the tail part is where two parts of the body _server_ and _interface (UI)_ get knitted and the shiny app is deployed. 

This is a basic Shiny's skeleton in the file format of *app.R*:
```{r}
library(shiny)                          # Head       - loading the shiny package
ui <- fluidPage()                       # Upper body - setting up the interface
server <- function(input, output) {}    # Lower body - setting up the server side
shinyApp(ui= ui, server = server)       # Tail       - knitting both sides together
```

For two separate files format Shiny, the *ui*.R will rewrite as
```{r}
library(shiny)
shinyUI(fluidPage())
```

and *server.R* rewrite as
```{r}
library(shiny)
shinyServer(function(input, output) {})
```

## UI side

In the beginning of UI, `fluidPage` sets the Shiny app's background page. Under the section of `fluidPage`, there're two main organs - Input() and Output() functions. 
```{r}
 ui <- fluidPage(
  # *Input() functions,
  # *Output() functions
)
```

There's also a layout option where we can rearrange how the shiny's outputs are positioned. 

## Input() functions

This is how a common Input() function is listed:
```{r}
sliderInput(inputId = "num", label = "Choose a number", ...)
```
- `sliderInput`: sliderInput() from a list of Input() functions
- `inputId`    : input name(internal use)
- `label`      : label to display on the input part of the Shiny app
- `.....`      : specific arguments or paremeters for the Input() functions

Here is a list of all Input() functions avaliable: 
![](https://www.dropbox.com/s/05hqa0yhcky9y82/shiny_input_functions.png?raw=1)

This is another Input() function with `sliderInput()`. 
```{r}
sliderInput(inputId = "num", 
label = "Choose a number", 
value = 25, min = 1, max = 100)
```
- `sliderInput`                   : sliderInput() from a list of Input() functions
- `inputId`                       : input name(internal use)
- `label`                         : label to display is "Choose a number"
- `value = 25, min = 1, max = 100`: value falls between 1 and 100 but the sliderbar sits at 25

## Output() functions

This is how a common Output() function is listed:
```{r}
plotOutput("hist")
```
- `plotOutput()`: This is to decide what sort of output to display 
- name label    : This is the name given to the output object

Here is a list of all Output() functions avaliable: 
![](https://www.dropbox.com/s/y3bdznx2d68k0bu/shiny_output_functions.png?raw=1)

## Input() and Output()

This is a simple Shiny app with the Input() and Output() functions. 
```{r}
library(shiny)

ui <- fluidPage( 
    sliderInput(inputId = "num",        # Input()  starts
    label = "Choose a number",          # Input()  continues
    value = 25, min = 1, max = 100),    # Input()  ends
    plotOutput("hist")                  # Output() starts/ends
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
```
- `sliderInput`         : sliderInput() from a list of Input() functions
- `inputId`             : an unique id to the widget so the server side knows how to access it. 
- `label`               : label as "Choose a number".
- `value = ... max = )` : input specific arguments or parameters. 
- `plotOutput("hist")`  : plotOutput() from Output() functions with the object called `hist`. 

**Attention**: While the Output() functions are placed in the UI component, it still needs to express or rebuild itself on the server side. 

## Server side

This is the skeleton for the server side.
```{r}
server <- function(input, output) {}
```

First, rebuild the Output() function's object from the UI side. The object was previously lablled as `hist`. In a way, `output$hist` is equivalent of `plotOutput("hist")`. 
```{r}
server <- function(input, output) {
    output$hist <- # code
}
```

Second, `renderYOUR_CHOSEN_OUTPUT_FUNCTION()` the output object. In this case, it's `renderPlot({})`. 
```{r}
server <- function(input, output) {
    output$hist <- renderPlot({ 
        hist(rnorm(100)) 
        }) 
}
```
- `output$hist`    : the Output() function's object on the server side. 
- `renderPlot`     : renderPlot as the renderYOUR_CHOSEN_OUTPUT_FUNCTION(). 
- `hist(rnorm(100)`: code block to rebuild the output object.

Here is a list of all potential `renderYOUR_CHOSEN_OUTPUT_FUNCTION()`:
![](https://www.dropbox.com/s/y3bdznx2d68k0bu/shiny_output_functions.png?raw=1)




