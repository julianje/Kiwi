library(shiny)

shinyUI(fluidPage(
  titlePanel("Kiwi Bootstrapper"),
  # Side bar
  sidebarLayout(
    sidebarPanel(
      img(src="Kiwi_small.png"),
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      uiOutput("varx"),
      uiOutput("vary"),
      selectInput('statistic', 'Statistic', c("Mean","Correlation","Mean difference")),
      numericInput('Samples','Number of bootstrap samples', 1000, min=100, max=100000),
      sliderInput('bins','Adjust bins in plot',
                  min=1,
                  max=50,
                  value=30),
      HTML('Implemented by <a href="http://web.mit.edu/jjara/www/">Julian</a> and powered by R, shiny, and boot.')
      ),
    mainPanel(
      plotOutput("distPlot"),
      h4("Usage"),
      p("Upload a csv file and choose two columns. Some statistics will use both columns; others only use the first one. Your data is deleted when you close the window."),
      HTML('<a href="http://web.mit.edu/jjara/www/KiwiExamples/ExampleData.csv">Download an example file.</a>')
    )
  )
))