library(rvest)
library(tidyverse)
library(dplyr)


#Let's practice scraping websites

#first we load the url of a website to a variable 

html = read_html("https://www.iitk.ac.in/math/faculty")

name = html %>% html_elements(".head3 a") 
name
class(name)
#here the class of "name" is a nodeset 


#right now it stores only the hyperlink is the a tag of the class head3 

name = html %>% html_elements(".head3 a") %>% html_text()
name

#If class = "character" that means the variable stores a string of characters. In R the strings of characters is treated like a vector. 
#hence when we try to input a[x] that means that it will return the character at the xth position in the string. 

class(name)

name[[1]]

#this is a doubt, here it shows that the class of "name" is character meaning it is a string, and when I put name[1] i get the "ANAND A." but
# when I put name[[1]] then also it outputs "ANAND A." 
# the double square brackets should be for lists. 

x = "DEVANSH"
substr(x, 1,4)
# to access the elements within a string us in the substring function. substring(var, start_index, stop_index)

substr(name, 1,5)
substr(name[1], 1,5)
substr(name[[1]], 1, 5)

#here when I gave substr to "name" it gave me the first 5 characters of all the names meaning that name is not a string it is either a vector 
# or list. 


x = c("DEV" ,"SHUTU")
class(x)
typeof(x)

x[1]
x[2]
x[[1]]
x[[2]]

#okay so that resolves the issue completely, whenever it shows the class or typeof of a variable as "character" it could mean either a string, or 
#vector etc. and the double brackets thing works even for vectors 

y = c("DEV", 2)
y[1]
y[2]
class(y)
typeof(y)
typeof(y[2])
# so here it is treating 2 as a character 

z = c(3,4,5,9,8)
class(z)

z = c(3, "DEV")
class(z)

#okay so if we create a vector with any element as a character we get the whole thing to be a character vector

list = list("DEV", 1, 2, c(1,2,7,8,9,10))
typeof(list)
class(list)

dims = dim(z)

dims = integer(length = 5)
dims
x = c(5,1)
y = as.integer(x)
typeof(as.integer(x))
arr = array(c(1,2,3,4,5), dim = y )

# the dim attribute of array function takes integer vector as input and I can make an integer vector by using as.intger to c(stuff)
typeof(arr)
class(arr)
dim(z)

#This clearly shows the difference now, the typeof function will return the basic type of material stored inside a variable like numeric or integer
# or double, character etc. however the class function gives us the object type like array, matrix , list or vector. 

#now to generalise, whenever we get the output of class as character or numeric etc that means the variable is a vector object. And functions or 
#operations applied to vectors happen on every element of the vector.


#okay so the dim function is designed for arrays, matrices etc and not for single dimension things entities like vector and LIST

#coming back to the topic.

class(name)
#from all of this we learn that the html_text() blah blah returns a vector

html = read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
name = html %>% html_elements(".head2") %>% html_text()
name
class(name)
list = as.list(name)
class(list[[2]])
class(list[2])

#this makes it clear, when I converted the vector into a list, I made a list in which every element(that is the name) is a list and each list 
#contains the string(vector) of the name. 

html = read_html("https://www.imdb.com/chart/top/")
name = html %>% html_elements(".ipc-title__text") %>% html_text()
print(name)


name = name[3:252]
name
class(name)

class(name[1])

name
name1 = list(numeric(length = 250))
for(i in 1:250){
  name1[1] = (strsplit(name[i], ' '))
}

name1