#Let red balls be denoted by 1, blue balls be denoted by 2 and green balls be denoted by 3
sample(x = 1:3, size = 1, prob = c(3/7, 2/7, 2/7))

A = matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
class(A[1,1])
S = norm(A[,1], type = "2")+norm(A[,2], type = "2")+norm(A[,3], type = "2")
p1 = norm(A[,1], type = "2")/S
p2 = norm(A[,2], type = "2")/S
p3 = norm(A[,3], type = "2")/S



sample(x = 1:3, size = 1, prob = c(p1, p2, p3))

runif(n = 1, min = 0, max = 5)


exceed = function()
{
  count = 0
  sum = 0
  while(sum < 1)
  {
    n = runif(n = 1, min = 0, max = 1)
    sum = sum + n
    count = count + 1
  }
  return(count)
}
exceed()


store =  numeric(length = 1000)
for(r in 1:1000)
{
  store[r] = exceed()
}
store

mean(store)




attempts = function(age,count){
  if(age <= 1){return(count)}
  
  n = sample(x = 1:age, size = 1)
  count = count + 1
  print(count)
  
  attempts(age - n,count)
}


attempts(25,0)

Store =  numeric(length = 1000)
for(r in 1:1000)
{
  Store[r] = attempts(25,0)
}

Store

mean(Store)


