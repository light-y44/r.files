cricket = read.csv("battingbowling.csv")
cricket 
summary(cricket)
str(cricket)

all_rounders = cricket$Batting >25 & cricket$Bowling <40
all_rounders
#all_rounders= with(cricket, X[(Bowling < 40)&(Batting > 25)])
all_round = cricket[all_rounders, ]
all_round

mode(all_round$Team)
names(which.min(table(all_round$Team)))
al <- NULL
i <- 0

#for (x in all_rounders1){
 # i <- i + 1
 #al[i] = with(cricket, Team[X == x])
#}

