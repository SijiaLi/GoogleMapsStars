library(ggmap)

load("places.rda")
data <- (places$properties)$Location
data <- data.frame(data$`Business Name`, data$`Address`,(data$`Geo Coordinates`)$Longitude, (data$`Geo Coordinates`)$Latitude)
names(data) <- c("title", "address", "long", "lat")


get_map(geocode('Back Bay, MA'), zoom=12) -> BOSTON
ggmap(BOSTON) + geom_point(data, aes(x=long, y=lat), size= 0.1) + scale_size(range=c(0, 0.5))

