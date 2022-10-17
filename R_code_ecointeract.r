# This is a code for investigating relationships among ecological variables

# We are using the sp package. To install it use:
# install.packages("sp")
library(sp) # you can also make use of require()

# We are using meuse:
# search for: "meuse dataset R sp package"
# https://cran.r-project.org/web/packages/gstat/vignettes/gstat.pdf

# data is used to recall datasets:
data(meuse)
# meuse is a dataframe (a dataframe is called table)

# View is used to see all the data of a dataset
View(meuse)
# remember that R is sensible to capital letters

# dev.off is used to destroy a specific plot:
dev.off()

# use the head function if your goal is to see just a specific part (the heads) of a table:
head(meuse)

# use the names function if you want to see only the names present in a table:
names(meuse)

# to calculate mean values, medians, quartiles, and min/max, use the function summary:
summary()

# to plot one variable in relation with another one, use the function:
plot(cadmium, zinc)
# surprise, you can't! the reason is that these objects are somewhat hidden in the table, because they are perceived as part of the object "meuse"
# the symbol $ is then used to link things one to each other. so:
plot(meuse$cadmium, meuse$zinc)

# extra! if you want to change the language, for example to english:
Sys.setenv(LANG = "en")

# to assign an object to a precise word, use:
cad <- meuse$cadmium
zin <- meuse$zinc
# and then:
plot(cad, zin)

# another solution, frequently used, especially with dataframes, is:
attach(meuse)
# and then:
plot (cadmium, zinc)

# there is also a function to detach, that is:
detach(meuse)

# to see relationships between variables, rely on the scatterplot matrices:
pairs(meuse)
# you will create all the potential relationships in just one plot. the exact number will be a permutation of the variables: N * (N-1)

# to change the colour of the plot, recall the previous function, add "col" and choose the colour you want:
plot(meuse$cadmium, meuse$zinc, col="blue")

# to change the size of the plot, recall the previous function, add "cex" and choose the size you want:
plot(meuse$cadmium, meuse$zinc, col="blue", cex=2)

# to change the shapes of the plot, recall the previous function, add "pch" and choose the size you want:
plot(meuse$cadmium, meuse$zinc, col="blue", cex=2, pch= 10)

# if you want to see just a portion of the columns of a dataset (subset), use:
meuse[,3:6]

# then, assign the meuse subset to a specific word:
pol <- meuse[,3:6]
pairs(pol, col="green3", cex=1.5)
pairs(pol, col="green3", cex=1.5, pch=20)

# to pair somme column using the names of the columns:
pairs(~cadmium+copper+lead+zinc, data=meuse)
pairs(~cadmium+copper+lead+zinc, data=meuse, col="green3")
# the use of the "tilde" (~) is essential when giving an input to R with the sign "+"

# -1 represents a negative correlation, 0 represents no correlation, while +1 represents a positive correlation


# R spatial

# to "explain" to R which are the coordinates:
coordinates(meuse) = ~x+y

# if we make a plot, then this is a spatial plot:
plot (meuse)

# moreover, x and y will now be referred to as "coordinates":
meuse

# to make a spatial plot of just one variable, with different colours, and, at the same time, give the plot the title you want:
spplot(meuse, "zinc", main="You're the best graph ever <3")

# we can also add plots of other variables next to the first one:
spplot(meuse, c("zinc","copper","lead"), main="You're the best graph ever <3")

# to make a plot with different sizes instead of different colours:
bubble(meuse, "zinc", main="You're the best graph ever <3")
