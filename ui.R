library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  titlePanel("Movie Explorer"),
  fluidRow(
    column(3,
      wellPanel(
        h4("What type of movie you want to explore?"),
        sliderInput("reviews", "Number of reviews on Rotten Tomatoes",
          10, 300, c(100, 300), step = 10),
        sliderInput("year", "Year released", 1940, 2014, value = c(1970, 2014),
          sep = ""),
        sliderInput("oscars", "Number of Oscar wins (all categories)",
          0, 11,c(3, 11), step = 1),
        sliderInput("boxoffice", "Dollars at Box Office (millions)",
          0, 800, c(200, 800), step = 1),
        selectInput("genre", "Genre (a movie can have multiple genres)",
          c("All", "Action", "Adventure", "Animation", "Biography", "Comedy",
            "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
            "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
            "Short", "Sport", "Thriller", "War", "Western")
        ),
        textInput("director", "Director name contains (e.g. Christopher Nolan)"),
        textInput("cast", "Cast names contains (e.g. Leonardo DiCaprio)")
      ),
      wellPanel(
        selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
        selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
        tags$small(paste0(
          "Note: The Tomato Meter is the proportion of positive reviews",
          " (as judged by the Rotten Tomatoes staff), and the Numeric rating is",
          " a normalized 1-10 score of those reviews which have star ratings",
          " (for example, 3 out of 4 stars)."
        ))
      ),
      wellPanel(
        radioButtons("picture", "Movie's common thing:",
                     c("Oscars: The Academy Awards, popularly known as the Oscars, 
          are awards for artistic and technical merit in the film industry. 
          They are regarded by many as the most prestigious and significant 
          awards in the entertainment industry worldwide.","Boxoffice: A box office or ticket office is a place where tickets
                          are sold to the public for admission to an event. 
                          Box office business can be measured in the terms of the 
                          number of tickets sold or the amount of money raised by 
                          ticket sales (revenue). The projection and analysis of 
                          these earnings is very important for the creative industries 
                          and often a source of interest for fans."),
                    ),
      ),
    ),
    column(9,
      ggvisOutput("plot1"),
      wellPanel(
        span("Number of movies selected:",
          textOutput("n_movies")
        )
      ),
      imageOutput("image")
    )
  )
)

