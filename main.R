## function to calculate probabilities of getting a specific unit on n rolls

#big assumption

#how it works -> one roll decides which COST of unit you got, and an independent roll decides which specific unit you got (correct me if wrong)


#assumption 1 : probabilities are based off the probability of getting that cost of unit
#e.g the probability of getting ANY legendary does not reduce if someone takes a legendary, just that specific one. and will increase the chances of getting others

#starting pool size is a constant subtract from it to get the number of units still in the pool. 

poolsize <- data.frame(onecost=39, twocost=26, threecost=21, fourcost=13, fivecost=10)

#base probabilties
baseProbs <- data.frame(onecost=c(1, 1, 0.7, 0.55, 0.4, 0.29, 0.24, 0.2, 0.1),
                        twocost=c(0,0,0.3,0.3,0.3,0.295,0.28,0.24,0.19),
                        threecost=c(0,0,0,0.15,0.25,0.31,0.31,0.31,0.31),
                        fourcost=c(0,0,0,0,0.05,0.1,0.15,0.2,0.3),
                        fivecost=c(0,0,0,0,0,0.005,0.02,0.05,0.1))
  
#gonna flip it because i manually entered it the rong way kappa
baseProbMatrix <- data.matrix(baseProbs)
baseProbMatrix2 <- t(baseProbMatrix)

baseProbs2 <- data.frame(baseProbMatrix2)
summary(baseProbs2)

#we should map unit name -> unitid and unitid -> cost of unit. for now we can calculate general RANGE and extend further after

unit_costs <- c(1,2,3,4,5)
sample(outcomes, 5,T,prob = baseProbMatrix2[,9])


sample(c(1,2,3,4,5),5, prob=c(0.5,0.5,0,0,0))


calcOneRoll <- function(unit_cost, player_level,probMatrix){
  #unitcost is either 1,2,3,4,5
  #player level is from 1-9
  probability = probMatrix[unit_cost,player_level]
  unit_outcomes <- c(1,2,3,4,5)
  dbinom(unit_outcomes,5,probability)
}


library(readr)
units <- read_csv("~/iloveyein/tft/units.csv")
View(units)

unitpool = 

calcOneRoll(5,9,baseProbMatrix2)


