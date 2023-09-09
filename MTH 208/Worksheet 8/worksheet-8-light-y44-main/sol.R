install.packages("dplyr")
library(dplyr)
library(tidyverse)
library(rvest)

html <- read_html("https://www.icc-cricket.com/rankings/womens/player-rankings/odi/batting")
tabless <- html %>% html_table()
tabless[[1]][1] = c(1:100)
batting = tabless[[1]]
batting
any(is.na(dat))
#df_filter = batting %>% arrange(Rating)
#df_filter

# df_sliced = batting %>% slice(5:25)
# df_sliced

# batting %>% slice_sample(n = 7)
# batting %>% select(Rating, Team, Player)
# batting %>% select(Team, everything())
 
starwars
class(starwars)
new_starwars = starwars %>% select(name: species)
new_starwars = new_starwars %>% filter(!is.na(hair_color), !is.na(birth_year), !is.na(mass))
new_starwars


new_starwars %>% mutate(BMI = (mass/(height*height/100))*100)

batting %>% distinct(Team)
by_country = batting %>% group_by(Team)
by_country %>% summarise(number = n())
by_country %>% summarise(avg.rank = mean(Pos), avg.rating = mean(Rating))
by_country %>% summarise(highest = max(Rating))

by_country  %>% summarise(avg.rating = mean(Rating)) %>% arrange(desc(avg.rating))

asia = c("THA", "IND", "PAK", "BAN", "SL")
# Create a new column for grouping based on your criteria
batting <- batting %>%
  mutate(group = ifelse(Team %in% asia, "Group1", "Group2"))

# Group the data frame by the new "group" column
by_asia <- batting %>%
  group_by(group)

by_asia

by_asia %>% summarise(ranking = n())
by_asia %>% summarise(rating = mean(Rating))
