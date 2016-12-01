library(jsonlite)

places <- fromJSON("Saved Places.json")
places <- places$features

save(places, file = "places.rda")
