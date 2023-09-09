library(imager)

dog = load.image('dog.jpeg')
plot(dog)


dim(dog)

col.mat = as.array(dog[,,1,])
col.mat

graydog = grayscale(dog)
plot(graydog)

dim(col.mat)
dim(graydog)

gray.mat = as.matrix(graydog[,,1,])
dim(col.gray)
dim(col.mat)

dims = dim(dog)
dis = matrix(0, nrow = dims[1], ncol = dims[2])
plot(dog)

#finding the purest green dot in the image "dog" 
for(i in 1:dims[1]){
  for(j in 1:dims[2]){
    dist[i,j] <- norm(col.mat[i,j,] - c(0,1,0), "2")
  }
}

puregreen = which(dist == min(dist), arr.ind = TRUE)
points(puregreen, col = "red")

dist <- matrix(0, nrow = dims[1], ncol = dims[2])
for(i in 1:dims[1])
{
  for(j in 1:dims[2])
  {
    # replace c(0,1,0) with c(1,0,0) or c(0,0,1) for other problems
    dist[i,j] <- norm(col.mat[i,j, ] - c(0,1,0), "2")
  }
}

# find pixels with smallest distance
ind1 <- which(dist == min(dist), arr.ind = TRUE)
points(ind1, col = "red")

plot(dog)


col.mat == dog[i,j,]
