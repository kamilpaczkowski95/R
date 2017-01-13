library(shiny)
library(datasets)

# Define server logic required to summarize and view the 
# selected dataset
function(input, output) {
  output$miasto <- renderText(input$miasto)
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "zarobki" = salarydf,
           "oferty" = hon,
           "ogolne"= lud)
  })
 y<- reactive({
   lud[,as.numeric(input$zmienna)]
 })
 
 x<- reactive({
   lud[,as.numeric(input$zmienn)]
 })
 
 
  
  output$plot<-renderPlot({
    
    plot(x(),y(),xlab=names(lud[as.numeric(as.numeric(input$zmienn))]),ylab=names(lud[as.numeric(input$zmienna)]))
    
  })
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    datas<-datasetInput()
    summary(datas)
  })
  
  output$str <- renderPrint({
    datas<-datasetInput()
    str(datas)
  })
  
  output$data<- renderTable({
    datas<- as.numeric(input$miasto)
    hon[datas,]
  })
    output$down<-downloadHandler(
      filename = function(){
        paste("plot","pdf",sep=".")
      },
      content= function(file) {
        pdf(file)
        plot(x(),y(),xlab=names(lud[as.numeric(as.numeric(input$zmienn))]),ylab=names(lud[as.numeric(input$zmienna)]))
        dev.off()
      }
    )
    output$mymap <- renderLeaflet({
      leaflet() %>%
        addProviderTiles("Stamen.Toner",
                         options = providerTileOptions(noWrap = TRUE)
        ) %>%
        setView(lng = 21.020, lat = 52.259, zoom = 6)%>%
        addMarkers(lng=19.360,lat=51.369,popup="Belchatow")%>%
        addMarkers(lng=19.049,lat=49.819,popup="Bielsko-Biala")%>%
        addMarkers(lng=18.010,lat=53.120,popup="Bydgoszcz")%>%
        addMarkers(lng=18.639,lat=54.360,popup="Gdansk")%>%
        addMarkers(lng=19.020,lat=50.259,popup="Katowice")%>%
        addMarkers(lng=19.959,lat=50.060,popup="Krakow")%>%
        addMarkers(lng=22.570,lat=51.240,popup="Lublin")%>%
        addMarkers(lng=19.459,lat=51.770,popup="Lodz")%>%
        addMarkers(lng=20.489,lat=53.779,popup="Olsztyn")%>%
        addMarkers(lng=16.900,lat=52.399,popup="Poznan")%>%
        addMarkers(lng=21.999,lat=50.049,popup="Rzeszow")%>%
        addMarkers(lng=14.529,lat=53.430,popup="Szczecin")%>%
        addMarkers(lng=18.609,lat=53.020,popup="Torun")%>%
        addMarkers(lng=19.000,lat=50.160,popup="Tychy")%>%
        addMarkers(lng=21.020,lat=52.259,popup="Waraszawa")%>%
        addMarkers(lng=17.030,lat=51.110,popup="Wroclaw")
      
    })
 
}
