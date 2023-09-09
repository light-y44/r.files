#Worksheet 5 

library(profvis)

#firsty let's see the difference between vector and arrays
#So an array is still a vector but its a little more than that, it is a vector structure. 
#vectors are list of objects stored in one dimension, however arrays are stored in any dimension. 

#first let's complete worksheet 5 and then I will worry about why my code did not work in the assignment. 

profvis({
  attempts <- function(age)
  {
    count <- 0
    remain <- age # age no. of candles remain in the beginning
    while(remain > 0)
    {
      count <- count + 1
      # randomly choose any number between 1 and remain
      blow_out <- sample(1:remain, size = 1)
      remain <- remain - blow_out
    }
    return(count)
  }
  
  att_vec <- numeric(length = 1e3)
  for(i in 1:1e3)
  {
    att_vec[i] <- attempts(25)
  }
  
})

#there is no fundamental difference between character and string in R, it is not like in case of C.
#numeric is also known as double.

x = numeric(length = 10)

y = vector(mode = "integer", length = 5)
print(y)

typeof(y)

#a variable make denote a vector but when we use typeof function it will return the type of the vector like 'logical' 
# 'double', etc.

integer(length = 10)

#Okay so we can initialize a vector of a specific type directly, by using the type itself and giving length as argument

#profvis shows the profile of the code, the profile basically tells us, how much time and memory does each step take.

profvis({
  attempts <- function(age)
  {
    count <- 0
    remain <- age # age no. of candles remain in the beginning
    while(remain > 0)
    {
      count <- count + 1
      # randomly choose any number between 1 and remain
      blow_out <- sample(1:remain, size = 1)
      remain <- remain - blow_out
    }
    return(count)
  }
 
  replicate(1e3, attempts(25))
})

## don't fuck around with the syntax of profvis (try putting the } , and stuff)
#to compare which of them is faster, we use the rbenckmark library and the function benchmark. 

library(rbenchmark)

benchmark({
  att_vec <- numeric(length = 1e3)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(20)
  }
 },   
 replicate(1e4, attempts(20)), replications = 100
)

#notice the values of replicate are all lower than the loop. 
#benchmark is basically used to compare the performance of two functions or pieces of codes.
#the replications in the benchmark function tells it to run the function that many times and take the average performance
#of all those. 



#look at the results now, if we increase the number of iterations to 1e4 the replicate function is slower than the loop. 

benchmark({
  att_vec <- numeric(length = 1e3)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(20)
  }
},   
{
  att_vec1 <- NULL
  for(i in 1:1e4)
  {
    att_vec1 <- c(att_vec1, attempts(25))
  }
}, replications = 100
)
#the second method is much worse than the other two, what this may be hinting towards might be that the piece of code
#has to first do the attempts and also the combine operation and hence takes more time. 

#Let's make a profile of it to analyse 
profvis({att_vec1 <- NULL
for(i in 1:1e4)
{
  x = attempts(25)
  att_vec1 <- c(att_vec1, x)
}
})

#yess!! the combine arguments to make a vector also take a lot of time hence this method is costly. 
xe = NULL 
for(i in 1:100){
  xe = c(xe, runif(n = 1, min = 0, max = 1))
}

xe
A = matrix(xe, nrow = 5, ncol = 20)
print(A)

colMeans(A, dims = 1)

apply(A, 2 ,mean)

benchmark(colMeans(A, dims= 1), apply(A, 2, mean))


#colsmeans is faster independent of n and m 

t = NULL
for(i in 1:1e4){
  t = c(t, runif(1, min = 0, max = 1))
}

tx = runif(1e4, min = 0, max = 1)

benchmark({t = NULL
for(i in 1:1e4){
  t = c(t, runif(1, min = 0, max = 1))
}}, runif(1e4, min = 0, max = 1))


#using loops was very expensive and doing it all at once hardly took any time.

num1 <- numeric(length = 1e3)
num2 <- numeric(length = 1e6)
mat1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000)
mat2 <- matrix(0, nrow = 100, ncol = 1000)
arr <- array(0, dim = c(100,100,100))

object.size(num1)

#why are these extra values coming ?? and not directly 8*total number of entries???
