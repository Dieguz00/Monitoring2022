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
