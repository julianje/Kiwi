library(shiny)
library(ppcor)
library(ggvis)
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
    selectInput('var1', 'Variable 1', names(Data()))
  })

  output$var2 = renderUI({
    if (is.null(input$file1)) { return() }
    selectInput('var2', 'Variable 2', names(Data()))
  })

  output$var3 = renderUI({
    if (is.null(input$file1)) { return() }
    selectInput('var3', 'Variable 3', names(Data()))
  })
  
  output$var4 = renderUI({
    if (is.null(input$file1)) { return() }
    selectInput('var4', 'Variable 4', names(Data()))
  })
  
  output$distPlot <- renderPlot({
    
    if (is.null(input$file1)) { return() }
    if (!(input$var1 %in% names(Data()))){ return() }
    
    d<-Data()

    if (input$use=="first two"){
      res<-pcor(d[,c(input$var1,input$var2)],method=input$method)
    }
    if (input$use=="first three"){
      res<-pcor(d[,c(input$var1,input$var2,input$var3)],method=input$method)
    }
    if (input$use=="all four"){
      res<-pcor(d[,c(input$var1,input$var2,input$var3,input$var4)],method=input$method)
    }
    
    correls<-round(res$estimate,2)
    correls<-gather(add_rownames(data.frame(correls)),Variable,value,-rowname)
    
    pvals<-round(res$p.value,3)
    pvals<-gather(add_rownames(data.frame(pvals)),Variable,pvalue,-rowname)
    
    res<-dplyr::full_join(correls,pvals,by=c("rowname","Variable"))
    res<-mutate(res,label=paste(value,"\n(p=",pvalue,")",sep=""))
    
    ggplot(res,aes(x=rowname,y=Variable,fill=value,label=label))+geom_raster()+
      geom_text(color="white")+
      scale_x_discrete("")+
      scale_y_discrete("")+
      ggtitle(paste("Partial correlations (",input$method,")",sep=""))+
      theme_minimal()+theme(legend.position="none")
  })
})