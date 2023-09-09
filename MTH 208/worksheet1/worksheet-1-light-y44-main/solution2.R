euler = function(n)
{
  output = (1 + 1/n)^n
  return(output)
}

input = readline(prompt = "enter any number")
input = as.integer(input)
euler(input)
