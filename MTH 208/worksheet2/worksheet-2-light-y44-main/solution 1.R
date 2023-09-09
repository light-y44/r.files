seat = read.csv("seating.csv")
seat
summary(seat)
str(seat)
roll_numbers = seat$Roll.No
roll_numbers[1]
x = 0
i = 1
for(n in 1:97){
  if(roll_numbers[i] > 1000000){
    x = x + 1
  }
  i = i+1
}
o = 97 - x
print(paste0("The number of MSc students are ", x))
print(paste0("The number of BS students are ", 97-x))
 
dim(seat)[1]            
sum(seat$Roll.No > 1000000)
      