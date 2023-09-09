factorial = function(n)
{
  i = n
  product = 1 
  while(i > 0)
  {
    
    product = product*i
    i = i - 1 
  }
  return(product)
}

input = readline(prompt = "Enter any number")
input = as.integer(input)
result = factorial(input)
result


