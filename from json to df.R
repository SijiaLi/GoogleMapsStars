library(jsonlite)

places <- fromJSON("Saved Places.json")
places <- places$features

data <- (places$properties)$Location
data <- data.frame(data$`Business Name`, data$`Address`,(data$`Geo Coordinates`)$Longitude, (data$`Geo Coordinates`)$Latitude)
names(data) <- c("title", "address", "long", "lat")


save(data, file = "data.rda")