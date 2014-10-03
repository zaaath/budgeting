library(reshape2);

expenses <- read.csv("week5/week5_expenses.csv", colClasses = c("Date", "factor", "numeric", "numeric", "factor", "factor", "character", "factor", "factor", "numeric", "character"))

# Sources of income (monthly)
## Available funds
funds <- 2500
## Income (Dasha + Lev)
income <- (250 / 7 * 30 + 1500) / 30 * 7
## Required expenses (rent + utilities + T-mobile + Gym)
reqexps <- (800 + 70 + 60 + 50) / 30 * 7
## Current expenses
exps <- sum(expenses$Amount)

length <- 4
# Prepare array for <length> periods
forecast <- array(1:length)

forecast[1] <- funds
for (n in 2:length) {
    funds <- funds + income - reqexps - exps
    forecast[n] <- funds
}

plot(forecast, main="Funds forecast", xlab="weeks after now", ylab="funds", ylim=c(0, max(forecast)), type="l")