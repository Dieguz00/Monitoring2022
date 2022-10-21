# this code is for ggplot2 based graphs

# use the ggplot2 library:
library(ggplot2)

# creation of a data frame (table) of ecological variables:

# we create two arrays:
virus <- c(10, 30, 40, 50, 60, 80)
death <- c(100, 240, 310, 470, 580, 690)

# the function to create the data frame:
data.frame(virus, death)

# we can assign the dataframe to an object:
d <- data.frame(virus, death)

# summary of some objects (result is the univariate statistics of the table):
summary(d)

# to create a new ggplot we use the function ggplot(data, aesthetics(x=, y=)) + geometry we want to use (lines, point, ecc). In this case we use the function geom_point().
ggplot(d, aes(x=virus, y=death)) + geom_point()

# we can add information to geom_point()
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="red", pch=17)

# it is possible to use lines (the function connest observation in increasing order of x):
ggplot(d, aes(x=virus, y=death)) + geom_line()

# it is also possible to join different functions: 
ggplot(d, aes(x=virus, y=death)) + geom_point() + geom_line()

# or polygons: 
ggplot(d, aes(x=virus, y=death)) + geom_polygon()


# let's use our own data from outside R:
setwd("C:/lab/")

# now let's take the data inside the folder:
read.table("covid_agg.csv")

# here the header is false because the first row contains just the names of the columns
# the separator is useful for separating different columns

# now let's assign it to a proper name:
covid <- read.table("covid_agg.csv")

# let's see the head of the folder:
head(covid)

# to correct the header:
covid <- read.table("covid_agg.csv", header=T)

# now let's have access to all the data of the folder:
covid

# to see a summary of the data:
summary(covid)

# let's do a ggplot with ggplot2, putting also aesthetics:
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point(size=3, col="green3", pch=17)

# to change the size of the points based on a variable:
ggplot(covid, aes(x = lon, y = lat, size=cases)) + geom_point(col="green3", pch=17)
