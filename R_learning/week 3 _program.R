g <- read.csv(file = "final-diabetes-data-for-R-csv2.csv",
              header=TRUE, sep=',')
colnames(g)
dm = g[,'dm']
dm2 = as.factor(dm)
insurance = g[,'insurance']
age = g[,'age']
chol = g[,'chol']
insurance = as.factor(g[,'insurance'])

m= glm (dm2 ~ insurance+age+chol, family = binomial(link =logit)) 
# answersheet 

# analyse table of deviance 
anova(m, test = "Chisq") 
## Analysis of Deviance Table 
##  
## Model: binomial, link: logit 
##  
## Response: dm 
##  
## Terms added sequentially (first to last) 
##  
insurance <- as.factor(g[,'insurance']) 
m <- glm(dm ~ age + chol + insurance, family=binomial (link=logit)) 
summary(m) 
exp(m$coefficients) 
exp(confint(m)) 
anova(m, test = "Chisq") 
#week 4 testing based on backward model
##### Make the variables and run the models #####

dm <- as.factor(g[,"dm"]) 
insurance <- as.factor(g[,"insurance"])# let's say 0=none, 1=gov, 2=private 
fh <- as.factor(g[,"fh"]) # 1=FH, 0=no FH 
smoking <- as.factor(g[,"smoking"]) # 1,2,3 
chol <- g[,'chol'] 
hdl <- g[,'hdl'] 
ratio <- g[,'ratio'] 
location <- as.factor(g[,'location']) 
age <- g[,'age'] 
gender <- as.factor(g[,'gender']) 
frame <- as.factor(g[,'frame']) 
systolic <- g[,'bp.1s'] 
diastolic <- g[,'bp.1d']
model <- glm(dm ~ age + bmi + chol + hdl + systolic + diastolic, family = binomial(link = logit)) 
anova (model,test = "Chisq") # test significance and find out which to drop

# drop diastolic as it has leas deviance residual and p value high

model1 <- glm(formula = dm ~ age + bmi + chol + hdl, family = binomial(link = logit)) 
# coefficient of other did not changed much when we reduce BP , which is good 
# but why it did had impact despite literature stating so , may be its coreleated with some thing 
cor.test(systolic, hdl) # not significant 
cor.test(systolic, bmi) # significant 
cor.test(systolic, chol) # very significant

# adding  more predictable
model <- glm(dm ~ age + bmi + chol + hdl + systolic + diastolic + gender + location + frame + insurance + smoking, family = binomial(link = logit)) 
