#This code is for ggplot2 based graphs

#Use the ggplot2 library:
library(ggplot2)

#Creation of a data frame (table) of ecological variables:

#We create two arrays:
virus <- c(10, 30, 40, 50, 60, 80)
death <- c(100, 240, 310, 470, 580, 690)

#The function to create the data frame:
data.frame(virus, death)

#We can assign the dataframe to an object:
d <- data.frame(virus, death)

#Summary of some objects (result is the univariate statistics of the table):
summary(d)

#To create a new ggplot we use the function ggplot(data, aesthetics(x=, y=)) + geometry we want to use (lines, point, ecc). In this case we use the function geom_point().
ggplot(d, aes(x=virus, y=death)) + geom_point()

#We can add information to geom_point()
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="red", pch=17)

#It is possible to use lines (the function connest observation in increasing order of x):
ggplot(d, aes(x=virus, y=death)) + geom_line()

#It is also possible to join different functions: 
ggplot(d, aes(x=virus, y=death)) + geom_point() + geom_line()

#Or polygons: 
ggplot(d, aes(x=virus, y=death)) + geom_polygon()
