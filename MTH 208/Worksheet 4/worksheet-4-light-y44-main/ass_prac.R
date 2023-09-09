tennis = function(p){
  A = 0
  B = 0
  for(x in 1:5){
    result = sample(0:1, size =1,prob = c(1-p,p))
    if(result == 1){
      A = A +1 
    }
    else{
      B = B+1
    }
    if(A == 3 || B == 3){
      break
    }  
  }
  return(x)
}