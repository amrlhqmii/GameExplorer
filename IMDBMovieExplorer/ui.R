library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  titlePanel("IMDB Movie Explorer"),
  fluidRow(
    column(3,
      wellPanel(
        h3("What type of movie do you want to explore?"),
        selectInput("genre", "Genre (a movie can have multiple genres)",
                    c("All", "Action", "Adventure", "Animation", "Biography", "Comedy",
                      "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
                      "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                      "Short", "Sport", "Thriller", "War", "Western")
        ),
        sliderInput("year", "Year released", 1940, 2014, value = c(1970, 2014),
          sep = ""),
        sliderInput("boxoffice", "Moneys made from Box Office (millions)",
                    0, 800, c(200, 800), step = 1),
        radioButtons("oscars","Oscars won for all categories (minimum)",
                     choices = list("0" = 0,"1" = 1, "2" = 2, "3" = 3, "4" = 4, "5" = 5), 
                     selected = 1),
        textInput("director", "Director name contains (e.g. Christopher Nolan)"),
        textInput("cast", "Cast names contains (e.g. Leonardo DiCaprio)")
      ),
      wellPanel(
        selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
        selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
      ),
      wellPanel(
        h4("Powered by:"),
        tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/RStudio-Ball.png", height = 70, length = 70),
      ),
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Data",column(6,
                                         ggvisOutput("plot1"),
                                         wellPanel(
                                           span("Number of movies selected:",
                                                textOutput("n_movies")
                                           ),
                                         ),
                                         wellPanel(
                                           h4("Oscars"),
                                           tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Oscars.jpg", height = 300, length = 300),
                                           h5("The Academy Awards, popularly known as the Oscars, 
          are awards for artistic and technical merit in the film industry. 
          They are regarded by many as the most prestigious and significant 
          awards in the entertainment industry worldwide."),
                                         ),)),
                  tabPanel("User Guide",column(12,
                                               wellPanel(
                                                 h3("How To Use?"),
                                                 h5("1. Choose any movie's genre based on your interest (a movie can have multiple genres)."
                                                    ),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20014135.png", height = 200, length = 200),
                                                 h5("2. Choose the range of any year you want the movie to be released and the range of 
                                                 how much moneys its made from Box Office (millions)."),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20014151.png", height = 200, length = 200),
                                                 h5("3. Choose how much the minimum Oscars you want the movies won for all categories."),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20014207.png", height = 200, length = 200),
                                                 h5("4. Two optional filters are given to let you choose any movie contain any cast or you want any movie to 
                                                    be direct by any director chosen. You can let it empty if you want."),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20014222.png", height = 200, length = 200),
                                                 h5("5. User can choose the graph's horizontal and vertical variable themselves by choose it from the list."),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20014054.png", height = 200, length = 200),
                                                 h5("6. Every single movie that met all the criteria chosen will shows up on the graph (Year released = 1970-2014,
                                                    Min Oscars won = 1, Moneys made from Box Office(millions) = 200-800). (e.g King Kong(2005))."),
                                                 tags$img(src = "https://raw.githubusercontent.com/amrlhqmii/IMDBMovieExplorer/main/image/Screenshot%202022-01-26%20015317.png", height = 400, length = 400),
                                               )))
                  ),
    ),
  )
)

