curl::curl("http://www.omdbapi.com/t=clue&r=json")

library(httr)
r <- GET("http://swapi.co/api/planets/1")
r
status_code(r)
headers(r)
str(content(r))
http_status(r)
r$status_code
warn_for_status(r)
content(r, "text"), # character vector