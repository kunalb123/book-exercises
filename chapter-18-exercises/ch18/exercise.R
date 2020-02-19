# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!

# RAN INTO TECHNICAL ISSUES WAS NOT ABLE TO REGISTER AN API KEY 
# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source(apikey.R)

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- 'Batman Begins'

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!
# Send the HTTP Request to download the data
# Extract the content and convert it from JSON

# THIS SITE GAVE ME A LOT OF TROUBLE; I KEPT GETTING A `SITE DOESN'T EXIST ERROR`
uri <- paste('https://api.nytimes.com/svc/movies/v2/', 'batman_begins', sep = '')
response <- GET(uri, query = api_key)
content <- content(response, 'text')
content_json <- fromJSON(content)
df <- content_json$data


# What kind of data structure did this produce? A data frame? A list?
# data frame I think

# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.
View(df)

# COULD NOT GET THE REST TO WORK

# Flatten the movie reviews content into a data structure called `reviews`
# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
# Create a list of the three pieces of information from above. 
# Print out the list.
