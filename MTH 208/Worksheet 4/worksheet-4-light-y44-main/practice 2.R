library(imager)
dog = load.image('dog.jpeg')
graydog = grayscale(dog)

plot(dog)


col.mat = as.array(dog[,,1,])
#x = as.array(dog)

# there is a difference beetween the above to lines of code, for col.mat the dim = x,y, 3 however for x the dimension is 
# x,y ,1,3


col.mat 

dims = dim(col.mat)

x_dim = dims[1]
y_dim = dims[2]

dis = matrix(0, nrow = x_dim, ncol = y_dim)

for(i in 1:x_dim){
  for(j in 1:y_dim){
    dis[i,j] = norm(col.mat[i,j,] - c(0,1,0), type = "2")
  }
}
#here we wanted to find a point with max green and min other colours, that's why we subtracted 1 from green and then 
# took the min of the whole thing. we cannot just do mat[i,j,2] -1 because that will just ensure the max of green but 
#the min of the other colours. 

purestgreen = which(dis == min(dis), arr.ind = TRUE)
points(purestgreen, col = 'red')
plot(dog)

#Question 3
pict1 = load.image('col1.png')
pict2 = load.image('col2.png')
pict3 = load.image('col3.png')

dims1 = dim(pict1[,,1,1:3])
dims2 = dim(pict2[,,1,])
dims3 = dim(pict3[,,1,])

col.mat1 = as.array(pict1[,,1,1:3])

x = col.mat[20,20,]
which.max(x)

which_colour = function(pict){
  plot(pict)
}
  
pict = load.image("col2.png")
which_colour(pict)


#Question 4
land1 = load.image("land2.jpeg")
land2 = load.image("land1.jpeg")

snow = function(img){
  col.mat = as.array(img[,,1,])
  dims= dim(col.mat)
  row = dims[1]
  col = dims[2]
  dist = matrix(0, nrow = row, ncol = col)
  
  for(i in 1:row){
    for(j in 1:col){
      dist[i,j] = norm(col.mat[i,j,] - c(1,1,1), "2")
    }
  }
  
  dist = mean(dist)
  
  return(dist)
}


if(snow(land1) > snow(land2)){
  print("Land 2 has more snow")
}else{
  print("land 1 has more snow")
}

invert = function(img){
  dims = dim(img)
  row = dims[1]
  col = dims[2]
  col.mat = as.array(img[,,1,])
  new.mat = as.array(img[,,1,])
  for(i in 1:row){
    for(j in 1:col){
      new.mat[i,j,] = col.mat[row-i+1,col-j+1,]
    }
  }
  par(mfrow = c(1,2))
  plot(img)
  plot(as.cimg(new.mat))
}

invert(dog)

turn = function(img){
  dims = dim(img)
  row = dims[1]
  col = dims[2]
  new.dim = c(col, row,3)
  col.mat = as.array(img[,,1,])
  new.mat = array(0, dim = new.dim)
  for(i in 1:row){
    for(j in 1:col){
      new.mat[col-j+1,i,] = col.mat[i,j,]
    }
  }
  par(mfrow = c(1,2))
  plot(img)
  plot(as.cimg(new.mat))
}
turn(dog)

#cropping
col.mat = as.array(dog[,,1,])
plot(as.cimg(col.mat[1:600,1:600,]))
plot(dog)

downscale = function(img){
  col.mat = as.array(img[,,1,])
  col.mat = col.mat[1:600,1:600,]

  new.mat = array(0, dim = c(300,300,3))
  for(i in 1:300){
    for(j in 1:300){
      ind1 = (2*(i-1)+1):(2*i)
      ind2 = (2*(j-1)+1):(2*j)
      averaging[1] = mean(col.mat[ind1,ind2,1])
      averaging[2] = mean(col.mat[ind1,ind2,2])
      averaging[3] = mean(col.mat[ind1,ind2,3])
      
      new.mat[i,j,] = averaging

    }
  }
  plot(as.cimg(new.mat))
}

downscale(dog)
averaging = rep(0,3)
averaging 


dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])
col.mat <- col.mat[1:600, 1:600, ]

reduce <- array(0, dim = c(300, 300, 3))
red.dims <- dim(reduce)

# I will take an average of the 2 by 2 pixels
# and then assign the average value to the reduce
averaging <- rep(0,3)
for(i in 1:red.dims[1])
{
  for(j in 1:red.dims[2])
  {
    ind1 <- (2*(i-1) + 1): (2*i)
    ind2 <- (2*(j-1) + 1): (2*j)
    
    # taking the average rbg in the 2 by 2 area
    averaging[1] <- mean(col.mat[ind1, ind2, 1])
    averaging[2] <- mean(col.mat[ind1, ind2, 2])
    averaging[3] <- mean(col.mat[ind1, ind2, 3])
    
    reduce[i, j, ] <- averaging
  }
}
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(reduce))


prop.col = function(img,col){
  col.mat = as.array(img[,,1,])
  dims = dim(col.mat)
  row = dims[1]
  col = dims[2]
  #dist = matrix(0, nrow = row, ncol = col)
  flag = 0
  for(i in 1:row){
    for(j in 1:col){
      dist = norm(col.mat[i,j,]- col, "2")
      if(flag < 0.5){
        flag = flag +1
      }
    }
  }
  prop <- flag/(row*col)
  return(prop)
}

prop.col(dog, c(0.2,1,0.3))


my.prop.color <- function(img, col)
{
  col.mat <- as.array(img[,,1,])
  dims <- dim(col.mat)
  
  dist <- matrix(0, nrow = dims[1], ncol = dims[2])
  for(i in 1:dims[1])
  {
    for(j in 1:dims[2])
    {
      dist[i,j] <- norm(col.mat[i,j, ] - col, "2")
    }
  }
  
  props <- sum(dist < .5)/(dims[1]*dims[2])
  return(props)
}

my.prop.color(dog,c(0.2,1,0.3))