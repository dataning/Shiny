library(tidyverse)
library(httr)
library(jsonlite)

path <- "https://data.police.uk/api/crimes-street/burglary?"

request <- GET(url = path,
               query = list(
                 lat = 53.778,
                 lng = -1.712,
                 date = "2018-01")
)

request$status_code
response <- content(request, as = "text", encoding = "UTF-8")
df <- fromJSON(response, flatten = TRUE) %>% 
  data.frame()

df <- select(df,
             month, category,
             location = location.street.name,
             long = location.longitude,
             lat = location.latitude)

head(df)

remotes::install_github("njtierney/ukpolice")
library(ukpolice)
library(ggplot2)

53.8075, -1.5406
holewood: lat = 53.778, lng = -1.712

crime_data <- ukp_crime(lat = 53.8075, lng = -1.5406)
head(crime_data)

crime_data_date <- ukp_crime(lat = 53.8075, 
                             lng = -1.5406,
                             date = "2019-10")
glimpse(crime_data_date)

crime_data %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ", crime_data_date$date[1])) +
  coord_flip() +
  theme_minimal()

library(leaflet)
crime_data <- ukp_crime(lat = 53.8075, lng = -1.5406)
#> No encoding supplied: defaulting to UTF-8.
crime_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(popup = ~category)
