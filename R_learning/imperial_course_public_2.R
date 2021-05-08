COPD <- read.csv('COPD_student_dataset.csv') # load data
View(COPD)
hist(COPD$MWT1Best) # column wise histo gram to check normal distribution
hist(COPD$FEV1)
hist(COPD$AGE)
hist(COPD$MWT1Best, main="Histogram of MWT1Best", xlab="MWT1Best", breaks=12) 
# above statement is labelling of graph with frequency of 12
subset(COPD, MWT1Best > 650) # selecting conditional data points
subset(COPD, MWT1Best > 600 | MWT1Best < 150) # | means or 

list("Summary" = summary(COPD$MWT1Best), "Mean" = mean(COPD$MWT1Best, na.rm=TRUE), "Standard Deviation" = sd(COPD$MWT1Best, na.rm=TRUE), "Range" = range(COPD$MWT1Best, na.rm=TRUE), "Inter-Quartile Range" = IQR(COPD$MWT1Best, na.rm=TRUE)) list("Summary" = summary(COPD$MWT1Best), "Mean" = mean(COPD$MWT1Best, na.rm=TRUE), "Standard Deviation" = sd(COPD$MWT1Best, na.rm=TRUE), "Range" = range(COPD$MWT1Best, na.rm=TRUE), "Inter-Quartile Range" = IQR(COPD$MWT1Best, na.rm=TRUE))
# above line is creating summary with naming each heads 
list("Summary" = summary(COPD$FEV1), "Mean" = mean(COPD$FEV1, na.rm=TRUE), "Standard Deviation" = sd(COPD$FEV1, na.rm=TRUE), "Range" = range(COPD$FEV1, na.rm=TRUE), "Inter-Quartile Range" = IQR(COPD$FEV1, na.rm=TRUE)) 
plot(COPD$FEV1, COPD$MWT1Best, xlab = "FEV1", ylab = "MWT1Best") # plotting 
cor.test(COPD$FEV1,COPD$MWT1Best, use= 'complete.obs', method = 'pearson') # pearson 
cor.test(COPD$FEV1,COPD$MWT1Best, use= 'complete.obs', method = 'spearman') # spearman complete.obs removes any missing data 
MWT1Best_FEV1 <- lm(MWT1Best~FEV1, data = COPD) # linear regression Y->X 
MWT1Best_AGE <- lm(MWT1Best~AGE, data = COPD)
MWT1Best_FEV1_AGE <- lm(MWT1Best~FEV1+AGE, data = COPD) # multiregression
confint(MWT1Best_FEV1_AGE)  # confidence interval
cor(COPD$FEV1,COPD$FVC, use = 'complete.obs',method = 'pearson')
lr1 <- lm(MWT1Best~FVC, data = COPD) # Run the regression, assigning the output to a new variable lr

summary(lr1) # View the output of the regression 

confint(lr1) # View the 95% confidence intervals of the regression
dim(COPD)
class(COPD$AGE) # type of vaiable 
summary(COPD$AGE) 
hist(COPD$AGE) 
class(COPD$CAT) 
hist(COPD$CAT) 
class(COPD$COPDSEVERITY)
table(COPD$gender, exclude = NULL) 
class(COPD$gender) 
COPD$gender <- as.factor(COPD$gender) # converting into categorical value
class(COPD$gender) 
table(COPD$gender, exclude = NULL) 
COPD$copd <- factor(COPD$copd) # converting into categorical variable
table (COPD$copd)
str(COPD$copd) # to visulalise each data
lr1 <- lm(MWT1Best~copd, data = COPD)
COPD$copd <- relevel(COPD$copd, ref=3) # changing reference level to category 3
# Create new variables from old ones 
comorbid <- length(COPD$Diabetes) 
comorbid[COPD$Diabetes==1 |COPD$hypertension ==1 |COPD$AtrialFib == 1 | COPD$IHD == 1] <- 1 # assign one if any disease is there 
# assign zero to rest of rows 
comorbid[is.na(comorbid)]<- 0
comorbid <- factor(comorbid)
table (comorbid)
print (comorbid)
str(comorbid)
comorbid[10]
COPD$comorbid <- comorbid # add to main data

# mising few section of good practcie which check the relationship between predictor variables 
COPD$Diabetes <- c(0,1) # check first if they are factor or integer
COPD$AtrialFib <- c(0,1)[as.integer(COPD$AtrialFib)]
DAF <- COPD$Diabetes * COPD$AtrialFib  # combining impact of Atrial and Diabetis 
# multiple regression line 
r1 <- lm(MWT1Best~factor(Diabetes)+factor(AtrialFib)+factor(DAF), data=COPD) 
confint(r1)
summary(r1)
