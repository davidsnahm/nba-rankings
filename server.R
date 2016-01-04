library(maps)
library(mapproj)
rank <- read.csv("nba_rankings.csv")
library(reshape2)
teams <- c("76ers", "Bucks", "Bulls", "Cavaliers", "Celtics", "Clippers", "Grizzlies", "Hawks", "Heat", "Hornets", "Jazz",
           "Kings", "Knicks", "Lakers", "Magic", "Mavericks", "Nets", "Nuggets", "Pacers", "Pelicans", "Pistons",
           "Raptors", "Rockets", "Spurs", "Suns", "Thunder", "Timberwolves", "Trail Blazers", "Warriors", "Wizards", "League Average")
new_cols <- c("#ED174C", "#00471B", "#CE1141", "#860038", "#008348", "#ED174C", "#7399C6", "#E13A3E", "#98002E",
              "#1D1160", "#002B5C", "#724C9F", "#F58426", "#552582", "#007DC5", "#007DC5", "#061922", "#4D90CD",
              "#FFC633", "#002B5C", "#ED174C", "#CE1141", "#CE1141", "#8E9090", "#E56020", "#007DC3", "#005083",
              "#E03A3E", "#FDB927", "#E31837", "#061922")
df <- melt(rank, id.vars=c("Team", "Year"))
df$Team_f <- factor((df$Team), levels=teams)

shinyServer(function(input, output){
  output$map <- renderChart2({
    dat <- switch(input$var, 
                  "76ers" = df[df$Team_f == teams[1],],
                  "Bucks" = df[df$Team_f == teams[2],],
                  "Bulls" = df[df$Team_f == teams[3],],
                  "Cavaliers" = df[df$Team_f == teams[4],],
                  "Celtics" = df[df$Team_f == teams[5],],
                  "Clippers" = df[df$Team_f == teams[6],],
                  "Grizzlies" = df[df$Team_f == teams[7],],
                  "Hawks" = df[df$Team_f == teams[8],],
                  "Heat" = df[df$Team_f == teams[9],],
                  "Hornets" = df[df$Team_f == teams[10],],
                  "Jazz" = df[df$Team_f == teams[11],],
                  "Kings" = df[df$Team_f == teams[12],],
                  "Knicks" = df[df$Team_f == teams[13],],
                  "Lakers" = df[df$Team_f == teams[14],],
                  "Magic" = df[df$Team_f == teams[15],],
                  "Mavericks" = df[df$Team_f == teams[16],],
                  "Nets" = df[df$Team_f == teams[17],],
                  "Nuggets" = df[df$Team_f == teams[18],],
                  "Pacers" = df[df$Team_f == teams[19],],
                  "Pelicans" = df[df$Team_f == teams[20],],
                  "Pistons" = df[df$Team_f == teams[21],],
                  "Raptors" = df[df$Team_f == teams[22],],
                  "Rockets" = df[df$Team_f == teams[23],],
                  "Spurs" = df[df$Team_f == teams[24],],
                  "Suns" = df[df$Team_f == teams[25],],
                  "Thunder" = df[df$Team_f == teams[26],],
                  "Timberwolves" = df[df$Team_f == teams[27],],
                  "Trail Blazers" = df[df$Team_f == teams[28],],
                  "Warriors" = df[df$Team_f == teams[29],],
                  "Wizards" = df[df$Team_f == teams[30],])
    col <- 'black'
    if(input$var == "76ers") {
      col = new_cols[1]
    } else if(input$var == "Bucks") {
      col = new_cols[2]
    } else if(input$var == "Bulls") {
      col = new_cols[3]
    } else if(input$var == "Cavaliers") {
      col = new_cols[4]
    } else if(input$var == "Celtics") {
      col = new_cols[5]
    } else if(input$var == "Clippers") {
      col = new_cols[6]
    } else if(input$var == "Grizzlies") {
      col = new_cols[7]
    } else if(input$var == "Hawks") {
      col = new_cols[8]
    } else if(input$var == "Heat") {
      col = new_cols[9]
    } else if(input$var == "Hornets") {
      col = new_cols[10]
    } else if(input$var == "Jazz") {
      col = new_cols[11]
    } else if(input$var == "Kings") {
      col = new_cols[12]
    } else if(input$var == "Knicks") {
      col = new_cols[13]
    } else if(input$var == "Lakers") {
      col = new_cols[14]
    } else if(input$var == "Magic") {
      col = new_cols[15]
    } else if(input$var == "Mavericks") {
      col = new_cols[16]
    } else if(input$var == "Nets") {
      col = new_cols[17]
    } else if(input$var == "Nuggets") {
      col = new_cols[18]
    } else if(input$var == "Pacers") {
      col = new_cols[19]
    } else if(input$var == "Pelicans") {
      col = new_cols[20]
    } else if(input$var == "Pistons") {
      col = new_cols[21]
    } else if(input$var == "Raptors") {
      col = new_cols[22]
    } else if(input$var == "Rockets") {
      col = new_cols[23]
    } else if(input$var == "Spurs") {
      col = new_cols[24]
    } else if(input$var == "Suns") {
      col = new_cols[25]
    } else if(input$var == "Thunder") {
      col = new_cols[26]
    } else if(input$var == "Timberwolves") {
      col = new_cols[27]
    } else if(input$var == "Trail Blazers") {
      col = new_cols[28]
    } else if(input$var == "Warriors") {
      col = new_cols[29]
    } else if(input$var == "Wizards") {
      col = new_cols[30]
    }
#     g <- ggplot(dat, aes(x=Year, y=as.integer(value), group=1)) + geom_line(colour=color) + scale_x_continuous(breaks=c(1965, 1970, 1975, 1980, 1985, 1990, 1995, 2000, 2005, 2010, 2015), limits=c(input$range[1], input$range[2])) + scale_y_reverse() + scale_colour_manual(values=new_cols) + guides(colour=FALSE) + xlab("Year") + ylab("Team Ranking") + ggtitle("NBA Team Rankings 1964-2015")
#     g
      d <- subset(dat, dat$Year >= input$range[1] & dat$Year <= input$range[2])
      d$color <- c(col)
      n <- nPlot(value ~ Year, group="Team", type='lineChart', data=d)
      n$chart(xDomain=c(input$range[1], input$range[2]), yDomain=c(30, 1))
      n$chart(color="#! function(d){return 'black'} !#")
      n$chart(color=c(col, 'black'))
      n$chart(tooltipContent="#! function(key, x, y, e){return '<strong>' + 'Year: ' + '</strong>' + x + '<br>' + '<strong>' + 'Rank: ' + '</strong>' + ' ' + y} !#")
      n$set(width=625, height=500)
      return(n)
  })  
#   output$info <- renderText({
#     xy_str <- function(e) {
#       if(is.null(e))
#       {
#         return("NULL\n")
#       }
#       else
#       {
#       paste0("Year:", round(e$x, 0), "\n", "Rank:", round(e$y, 0), "\n")
#       }
#     }
#     paste0(xy_str(input$plot_hover))
#   })
})