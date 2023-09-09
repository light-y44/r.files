library(imager)
dog = load.image("dog.jpeg")
green_channel = dog[,,2]
purest_green = max(green_channel)
purest_green_cord = which(green_channel == purest_green, arr.ind = TRUE)
plot(dog)
points(purest_green_cord[,2], purest_green_cord[,1], col = "red", pch =16)



