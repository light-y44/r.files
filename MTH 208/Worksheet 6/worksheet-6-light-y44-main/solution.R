library(tidyverse)
library(rvest)

html = read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
name = html %>% html_elements(".head2") %>% html_text()
print(name)

html <- read_html("https://www.imdb.com/chart/top/")
name = html %>% html_elements(".ipc-title__text") %>% html_text()
print(name)

print(name[3:252])

# Define column names
column_names <- c("Movie_name", "Movie_year", "Movie_rating", "Number_of_votes")

# Create an empty data frame with the specified column names
df <- data.frame(matrix(nrow = 250, ncol = length(column_names)))
colnames(df) <- column_names

# Print the empty data frame
#print(empty_df)

df$Movie_name = name[3:252]
print(df["Movie_name"])

print(name)

year = html %>% html_elements(".sc-b85248f1-6.bnDqKN.cli-title-metadata-item") %>% html_text()
print(year)

# Shift elements and insert the new element
year <- append(year, list(NULL)) # Add a NULL placeholder at the end
for (i in rev((234 + 1):length(year))) {
  year[[i]] <- year[[i - 1]]
}
year[[234]] <- "X"

# Print the updated list
print(year)


for(i in 1:250){
  year[i] = year[3*i - 2]
}

print(year[1:250])


df$Movie_year = year[1:250]

vote_count = html %>% html_elements(".ipc-rating-star--voteCount") %>% html_text()
print(vote_count)