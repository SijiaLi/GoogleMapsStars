library(jsonlite)
json_data <- fromJSON("/Users/Sijia/Desktop/Saved Places.json")
dat <- json_data$features

loc <- dat$properties$Location
df <- loc[c("Address", "Business Name", "Geo Coordinates")]

nyc <- df[grep('NY', df$Address, perl=T),]

address <- c()
for (i in 1:nrow(nyc)){
  tmp <- as.character(nyc$Address[i])
  pos <- (gregexpr(pattern =', New York',tmp))[[1]]
  if (pos != -1) {
    add <- substr(tmp, 1, pos-1)
  } else {
    add <- tmp
  }
  address <- c(address, add)
}
nyc$Address <- address
nyc$latitude <- nyc$`Geo Coordinates`$Latitude
nyc$longitude <- nyc$`Geo Coordinates`$Longitude
nyc$`Geo Coordinates` <- NULL

write.csv(nyc, file = "nyc.csv", row.names = FALSE)
