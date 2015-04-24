library(shiny)

shinyUI(fluidPage(
  titlePanel("Kiwi raters"),
  # Side bar
  sidebarLayout(
    sidebarPanel(
      # Title
      img(src="Kiwi_small.png"),
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      radioButtons('method','Method',c("unweighted","equal","squared")),
      uiOutput("var1"),
      uiOutput("var2"),
      sliderInput("jitterval","Jitter in Plot 2",
                  value = 0.1, min=0, max=5,step=0.1),
      HTML('Implemented by <a href="http://web.mit.edu/jjara/www/">Julian</a> and powered by R, shiny, and <a href="http://cran.r-project.org/web/packages/irr/irr.pdf">irr</a>.')
      ),
    mainPanel(
      verbatimTextOutput("Kappa_results"),
      
      tabsetPanel(type = "tabs",
                  tabPanel("Plot 1",plotOutput("PlotA")),
                  tabPanel("Plot 2",plotOutput("PlotB"))
                  ),
      h2("Usage"),
      p("Upload a csv file and choose two coders. Your data is deleted when you close the window."),
      HTML('<a href="http://web.mit.edu/jjara/www/KiwiExamples/CodersExample.csv">Download an example file.</a>') 
    )
  )
))