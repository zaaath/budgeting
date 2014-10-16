library(reshape2);

expenses <- read.csv("week7/week7_expenses.csv", colClasses = c("Date", "factor", "numeric", "numeric", "factor", "factor", "character", "factor", "factor", "numeric", "character"))

# Sources of income (monthly)
## Available funds
funds <- 0
## Income
income <- (250 / 7 * 30 + 1450) / 30 * 7
## Required expenses (rent + utilities + T-mobile)
reqexps <- (800 + 70 + 60) / 30 * 7
## Current expenses
exps <- sum(expenses$Amount)
print(exps)

length <- 4
# Prepare array for <length> periods
forecast <- array(1:length)

forecast[1] <- funds
for (n in 2:length) {
    funds <- funds + income - reqexps - exps
    forecast[n] <- funds
}

plot(forecast, main="Funds forecast", xlab="weeks after now", ylab="funds", ylim=c(-max(forecast), max(forecast)), type="l")
