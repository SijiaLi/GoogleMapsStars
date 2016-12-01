library(ggmap)

load("data.rda")
get_map(geocode('Back Bay, MA'), zoom=12) -> BOSTON
ggmap(BOSTON) + geom_point(data, aes(x=long, y=lat), size= 0.1) + scale_size(range=c(0, 0.5))

