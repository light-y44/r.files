library(imager)
img = load.image('campus.jpeg')
dog  = load.image('dog.jpeg')
blue = load.image('col2.png')
prop.grey <- function(img)
{
  #img = round(img,digits = 1)
  col.mat = as.array(img[,,1,])
  col.mat = round(col.mat)
  dims = dim(col.mat)
  flag = 0
  #count = matrix(0, nrow = dims[1], ncol = dims[2])
  for(i in 1: dims[1]){
    for(j in 1:dims[2]){
      if((col.mat[i,j,1] == col.mat[i,j,2])&(col.mat[i,j,2] == col.mat[i,j,3])){
        flag = flag + 1
      }
    }
  }
  prop = flag/((dims[1])*dims[2])
  
  return(prop)
}

prop.grey(img)
