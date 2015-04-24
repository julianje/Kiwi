library(shiny)

shinyUI(fluidPage(
  # Side bar
  sidebarLayout(
    sidebarPanel(
      # Title
      img(src="Kiwi_small.png"),
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      radioButtons('method','Method',c("pearson","kendall","spearman")),
      uiOutput("var1"),
      uiOutput("var2"),
      uiOutput("var3"),
      uiOutput("var4"),
      HTML('Implemented by <a href="http://web.mit.edu/jjara/www/">Julian</a> and powered by R and shiny.')
      ),
    mainPanel(
      plotOutput("distPlot"),
      h2("Usage"),
      p("Upload a csv file and choose how many columns you want to use. Your data is deleted when you close the window."),
      HTML('<a href="https://github.com/julianje/Bunny/blob/master/Bunny/Bootstrapper/ExampleData.csv">Download an example file.</a>') 
    )
  )
))