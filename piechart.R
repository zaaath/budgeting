library(reshape2);

expenses <- read.csv("week7/week7_expenses.csv", colClasses = c("Date", "factor", "numeric", "numeric", "factor", "factor", "character", "factor", "factor", "numeric", "character"))

# Separate by categories
melted <- melt(expenses, id = c("Category"), c("Amount"))
catexps <- dcast(melted, Category ~ variable, sum)
print(sum(catexps$Amount))

# Draw pie chart
slices <- catexps$Amount
lbls <- catexps$Category
pie(slices, labels = lbls, main="Pie Chart of Expenses")