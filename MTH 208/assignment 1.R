probability = array(1/365, dim = 365)
probability

birthday = function(n){
  for(i in 1:n){
    arr = array(0, dim =n)
    arr[i] = sample(1:365, size = 1, prob = c(probability))
  }
  
  for(i in 1:n){
    for(j in i+1:n){
      if(arr[i] == arr[j])
        return(1)
    }
  }
  
  return(0)
}


birthday(10)


