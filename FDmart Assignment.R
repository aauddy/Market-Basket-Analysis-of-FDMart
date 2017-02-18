# Install & Load Package - arules and arulesViz
install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)

# Read the CSV file
mydata<- read.csv("C:/Users/USER/Documents/TransactionList.csv",stringsAsFactors=FALSE)
# head of the input data
head(mydata)
# split the data based on transactionID and 
#convert it from dataframe to transactions data type.
fdmart <- as(split(mydata$Item, mydata[,"TranID"]), "transactions")
# check the class of fdmart
class(fdmart)
#get the summary of fdmart 
summary(fdmart)
#Plot frequency of frequent Item set which has a support of 0.1
# i.e items which are 10% of the total transaction
itemFrequencyPlot(fdmart,support=0.1,cex.names=0.8, main="Frequent Item Plot of FDMart")
# Generate rules using apriori algorithm to enlist transactions
# that have 0.5% support and 80% confidence
rules <- apriori(fdmart, parameter = list(support=0.005, confidence=0.8))
rules
# Get the summary of the above rule
summary(rules)
# top 5 items having good support
itemFrequencyPlot(fdmart,topN=20,type="absolute",main="Top 20 Frequent Items")
##########################################


#Question1 -Beverage Rules
#  Wine -Subset of rules when Wine is on the right hand side
WineRules<-subset(rules,subset= rhs %pin% "Wine")
WineRules
summary(WineRules)
inspect(head(sort(WineRules,by="lift"),5))
plot(WineRules, main="Scatter Plot for Wine (rhs)")
plot(head(sort(WineRules,by="lift"),5),method="graph",interactive=TRUE,shading=NA)

# Subset of rules when Wine is on the left hand side
WineRules1<-subset(rules,subset= lhs %ain% "Wine")
WineRules1
summary(WineRules1)
inspect(head(sort(WineRules1,by="lift"),5))
plot(WineRules1, main="Scatter Plot for Wine (lhs)")
plot(head(sort(WineRules1,by="lift"),5),method="graph",interactive=TRUE,shading=NA)

#  Beer-Subset of rules when Beer is on the right hand side
BeerRules <- subset(rules,subset= rhs %pin% "Beer")
BeerRules
summary(BeerRules)
inspect(head(sort(BeerRules,by="lift"),5))
plot(BeerRules,main="Scatter Plot for Beer (rhs)")
plot(head(sort(BeerRules,by="lift"),5),method="graph",interactive=TRUE,shading=NA)

# Subset of rules when Beer is on the left hand side
BeerRules1 <- subset(rules,subset= lhs %ain% "Beer")
BeerRules1
summary(BeerRules1)
inspect(head(sort(BeerRules1,by="lift"),5))
plot(BeerRules1,main="Scatter Plot for Beer (lhs)")
plot(head(sort(BeerRules1,by="lift"),5),method="graph",interactive=TRUE,shading=NA)

# end of Beverage Rule
###########################################

# Question 2 - Canned vs Fresh

# Canned Vegetables on the right hand side
CanVegRules <- subset(rules,subset= rhs %pin% "Canned Vegetables")
CanVegRules
summary(CanVegRules)
inspect(head(sort(CanVegRules,by="lift"),10))
plot(CanVegRules, main ="Scatter Plot for Canned Vegetables (rhs)")

# Canned Vegetables on the left hand side
CanVegRules1 <- subset(rules,subset= lhs %ain% "Canned Vegetables")
CanVegRules1
summary(CanvegRules1)
inspect(head(sort(CanVegRules1,by="lift"),10))
plot(CanVegRules1, main ="Scatter Plot for Canned Vegetables (lhs)")


# Canned Fruit on the right hand side
CanFruitRules <- subset(rules,subset= rhs %pin% "Canned Fruit")
CanFruitRules
summary(CanFruitRules)
inspect(head(sort(CanFruitRules,by="lift"),10))
plot(CanFruitRules, main ="Scatter Plot for Canned Fruit (rhs)")


# Canned Fruit on the left hand side
CanFruitRules1 <- subset(rules,subset= lhs %ain% "Canned Fruit")
CanFruitRules1
summary(CanFruitRules1)
inspect(head(sort(CanFruitRules1,by="lift"),10))
plot(CanFruitRules1, main ="Scatter Plot for Canned Fruit (lhs)")


# Fresh Fruit on the right hand side
FreshFruitRules <- subset(rules,subset= rhs %pin% "Fresh Fruit")
FreshFruitRules
summary(FreshFruitRules)
inspect(head(sort(FreshFruitRules,by="lift"),10))
plot(FreshFruitRules, main ="Scatter Plot for Fresh Fruit (rhs)")

# Fresh Fruit on the left hand side
FreshFruitRules1 <- subset(rules,subset= lhs %ain% "Fresh Fruit")
FreshFruitRules1
summary(FreshFruitRules1)
inspect(head(sort(FreshFruitRules1,by="lift"),10))
plot(FreshFruitRules1, main ="Scatter Plot for Fresh Fruit (lhs)")

# Fresh Vegetables on the right hand side
FreshVegRules <- subset(rules,subset= rhs %pin% "Fresh Vegetables")
FreshVegRules
summary(FreshVegRules)
inspect(head(sort(FreshVegRules,by="lift"),10))
plot(FreshVegRules, main ="Scatter Plot for Fresh Vegetables (rhs)")


# Fresh Vegetables on the left hand side
FreshVegRules1 <- subset(rules,subset= lhs %ain% "Fresh Vegetables")
FreshVegRules1
summary(FreshVegRules1)
inspect(head(sort(FreshVegRules1,by="lift"),10))
plot(FreshVegRules1, main ="Scatter Plot for Fresh Vegetables (lhs)")

# Fresh Fish on the right hand side
FreshFishRules <- subset(rules,subset= rhs %pin% "Fresh Fish")
FreshFishRules
summary(FreshFishRules)
inspect(head(sort(FreshFishRules,by="lift"),10))
plot(FreshFishRules, main ="Scatter Plot for Fresh Fish (rhs)")

# Fresh Fish on the left hand side
FreshFishRules1 <- subset(rules,subset= lhs %ain% "Fresh Fish")
FreshFishRules1
summary(FreshFishRules1)
inspect(head(sort(FreshFishRules1,by="lift"),10))
plot(FreshFishRules1, main ="Scatter Plot for Fresh Fish (lhs)")

# Fresh Chicken on the right hand side
FreshChiRules <- subset(rules,subset= rhs %pin% "Fresh Chicken")
FreshChiRules 
summary(FreshChiRules )
inspect(head(sort(FreshChiRules ,by="lift"),10))
plot(FreshChiRules , main ="Scatter Plot for Fresh Chicken (rhs)")


# Fresh Chicken on the left hand side
FreshChiRules1 <- subset(rules,subset= lhs %ain% "Fresh Chicken")
FreshChiRules1 
summary(FreshChiRules1 )
inspect(head(sort(FreshChiRules1 ,by="lift"),10))
plot(FreshChiRules1 , main ="Scatter Plot for Fresh Chicken (lhs)")

#############################
# Question 3 - Small vs Large Transaction

#Get Small Transactions
SmallTran = rules[size(items(rules)) <= 5]
SmallTran
inspect(head(SmallTran))
plot(SmallTran, shading="order", control=list(main = "Two-key plot for Small Transaction"))

# Get Large Transactions
LargeTran = rules[size(items(rules)) > 5]
LargeTran
inspect(head(LargeTran))
plot(LargeTran, shading="order", control=list(main = "Two-key plot for Large Transaction"))
# end of Large Transaction
##################################


# Question 4- Interesting Pattern: Cheese
# Cheese and sliced bread on the LHS
CheeseBreadRule <- subset(rules, subset= lhs %ain% c("Cheese","Sliced Bread"))
CheeseBreadRule
inspect(head(CheeseBreadRule,20))
inspect(head(sort(CheeseBreadRule,by="lift"),20))
plot(CheeseBreadRule,main= "Cheese Bread Plot")
plot(head(sort(CheeseBreadRule,by="lift"),5),method="graph",interactive=TRUE,shading=NA)

# End of Interesting Pattern
################################