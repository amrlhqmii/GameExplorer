library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  titlePanel("OMDB Movie Explorer"),
  fluidRow(
    column(3,
      wellPanel(
        h4("What type of movie you want to explore?"),
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
        radioButtons("picture", "Movie's common thing:",
                     c("Oscars: The Academy Awards, popularly known as the Oscars, 
          are awards for artistic and technical merit in the film industry. 
          They are regarded by many as the most prestigious and significant 
          awards in the entertainment industry worldwide."),
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
      wellPanel(
      imageOutput("image")
    ))
  )
)
