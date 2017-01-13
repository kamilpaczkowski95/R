library(shiny)

# Define UI for dataset viewer application
fluidPage(
  
  # Application title.
  titlePanel(h4("Oferty Pracy w Branzy IT",align="center")),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view. The helpText function is
  # also used to include clarifying text. Most notably, the
  # inclusion of a submitButton defers the rendering of output
  # until the user explicitly clicks the button (rather than
  # doing it immediately when inputs change). This is useful if
  # the computations required to render output are inordinately
  # time-consuming.
  sidebarLayout(
    sidebarPanel(
      selectInput("zmienn","Wybierz kolumne",choices = c("lata" = 1,
                                                          "ludnosc" = 2,
                                                          "gdp"= 3,
                                                          "sp500"= 4,
                                                          "zloto"= 5,
                                                          "ropa"= 6)),
      selectInput("zmienna","Wybierz kolumne",choices = c("lata" = 1,
                                                          "ludnosc" = 2,
                                                          "gdp"= 3,
                                                          "sp500"= 4,
                                                          "zloto"= 5,
                                                          "ropa"= 6)),
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("zarobki", "oferty","ogolne")),
      
      selectInput("miasto","Wybierz miejscowosc",c(
        "Belchatow"=15,"Bielsko-Biala"=16,"Bydgoszcz"=7,"Gdansk"=6,"Katowice"=8,"Krakow"=3,"Lublin"=11,"Lodz"=5,"Olsztyn"=13,"Poznan"=4
        ,"Rzeszow"=10,"Szczecin"=9,"Torun"=12,"Tychy"=14,"Warszawa"=2,"Wroclaw"=1))
    ),
    
   
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("Summary",verbatimTextOutput("summary")),
                  tabPanel("Structurte",verbatimTextOutput("str")),
                  tabPanel("Data",tableOutput("data")),
                  tabPanel("Plot",plotOutput("plot"),downloadButton("down","Pobierz wykres")),
                  tabPanel("Mapa",leafletOutput("mymap"))
                  )
      
      
    
    )
  )
)
