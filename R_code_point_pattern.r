# Point pattern analysis for population ecology

# use of working directory
setwd("C:/lab/")

covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

install.packages("spatstat")
library(spatstat)

# if you attach:
attach(covid)
covid_planar <- ppp(x=lon, y=lat, c(-180,180), c(-90, 90))
# where "lon" means longitude, while "lat" means latitude

# without attaching:
covid_planar <- ppp(x=covid$lon, y=covid$lat, c(-180,180), c(-90, 90))

plot(covid_planar)

# to calculate how much dense are the points:
density_map <- density(covid_planar)
plot(density_map)

# to add points to the graph:
points(covid_planar)
points(covid_planar, pch=19)
points(covid_planar, pch=19, col="green")

# changing colours:
cl <- colorRampPalette(c('green','orange','pink'))(100)
plot(density_map, col = cl)
points(covid_planar)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar)

# or, increasing also the resolution:
cl <- colorRampPalette(c("purple","blue", "green", "yellow", "orange", "red", "magenta"))(1000) # 
plot(density_map, col = cl)
points(covid_planar)

