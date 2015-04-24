library(shiny)
library(irr)
library(ggplot2)
library(dplyr)
library(tidyr)

shinyServer(function(input, output){
  
  Data <- reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return (NULL)
    
    df <- read.csv(inFile$datapath, header=TRUE)
    return(df)
  })
  
  output$var1 = renderUI({
    if (is.null(input$file1)) { return() }
    selectInput('var1', 'Coder 1', c(names(Data())))
  })

  output$var2 = renderUI({
    if (is.null(input$file1)) { return() }
    selectInput('var2', 'Coder 2', c(names(Data())),names(Data())[2] )
  })
  
  output$Kappa_results <- renderPrint({
    if (is.null(input$file1)) { return() }
    if (!(input$var1 %in% names(Data()))){ return() }
    d<-Data()
    inputs<-c(input$var1,input$var2)
    inputs<-unique(inputs)
    # You need at least 2 variables
    if (length(inputs)<2){ return()}
    kappa2(d[,inputs],weight=input$method)
  })
  
  output$PlotA <- renderPlot({
    
    if (is.null(input$file1)) { return() }
    if (!(input$var1 %in% names(Data()))){ return() }
    
    d<-Data()
    inputs<-c(input$var1,input$var2)
    inputs<-unique(inputs)
    
    # You need at least 2 variables
    if (length(inputs)<2){ return()}
    
    d<-d[,inputs]
    names(d)=c("x","y")
    d %>% add_rownames %>% gather(Variable,Value,x,y) %>%
      ggplot(aes(x=Variable,y=Value,group=rowname))+geom_point(size=3,alpha=3/4)+geom_line()+
      theme_linedraw()+
      scale_x_discrete("Coders",labels=c(input$var1,input$var2))+
      scale_y_continuous("Judgments")
  })
  
  output$PlotB <- renderPlot({
    
    if (is.null(input$file1)) { return() }
    if (!(input$var1 %in% names(Data()))){ return() }
    
    d<-Data()
    inputs<-c(input$var1,input$var2)
    inputs<-unique(inputs)
    
    # You need at least 2 variables
    if (length(inputs)<2){ return()}
    
    d<-d[,inputs]
    names(d)=c("x","y")
    d %>% 
      ggplot(aes(x=x,y=y))+geom_point(size=3,alpha=3/4,position=position_jitter(height=input$jitterval,width=input$jitterval))+
      theme_linedraw()+
      scale_x_continuous(input$var1)+
      scale_y_continuous(input$var2)+
      ggtitle("Jittered scatterplot")
  })
  
})