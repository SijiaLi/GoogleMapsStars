library(jsonlite)
json_data <- fromJSON(file="/Users/Scarlett/Dropbox/Projects/GoogleMapsStars/NYC.json")
dat <- json_data[2]
dat <- dat$features
n <- length(dat)
df <- data.frame()
for (i in 1:n) {
  place <- dat[[i]]
  bus <- place$properties
  loc <- bus$Location
  loc <- data.frame(loc$`Business Name`, loc$Address, loc$`Geo Coordinates`$Latitude, loc$`Geo Coordinates`$Longitude)
  df <- rbind(df, loc)
}
names(df) <- c("Business Name", "Address", "latitude", "longitude")

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

write.csv(nyc, file = "nyc.csv", row.names = FALSE)
