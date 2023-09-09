data = read.csv("seating.csv")
seat = with(data, Seat.Number[Roll.No == 220345])
seat
