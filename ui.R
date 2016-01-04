teams <- c("76ers", "Bucks", "Bulls", "Cavaliers", "Celtics", "Clippers", "Grizzlies", "Hawks", "Heat", "Hornets", "Jazz",
           "Kings", "Knicks", "Lakers", "Magic", "Mavericks", "Nets", "Nuggets", "Pacers", "Pelicans", "Pistons",
           "Raptors", "Rockets", "Spurs", "Suns", "Thunder", "Timberwolves", "Trail Blazers", "Warriors", "Wizards", "League Average")
require(rCharts)
require(shiny)

shinyUI(fluidPage(
  titlePanel("NBA Team Rankings (1964-2015)"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("See each team's trend in league rank"),
      selectInput("var", label="Choose a team", choices=list("76ers", "Bucks", "Bulls", "Cavaliers", "Celtics", "Clippers", "Grizzlies", "Hawks", "Heat", "Hornets", "Jazz",
                                                             "Kings", "Knicks", "Lakers", "Magic", "Mavericks", "Nets", "Nuggets", "Pacers", "Pelicans", "Pistons",
                                                             "Raptors", "Rockets", "Spurs", "Suns", "Thunder", "Timberwolves", "Trail Blazers", "Warriors", "Wizards")),
      sliderInput("range", label="Select Year Range", min=1964, max=2015, value=c(1964, 2015), sep="", step=1)
    ),
    mainPanel(
      showOutput("map", "nvd3")
      #, hover="plot_hover"),
     # verbatimTextOutput("info")
    )
    
  )
))