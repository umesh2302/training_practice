#diabetes data for R csv
g <- read.csv(file = "final-diabetes-data-for-R-csv2.csv",
              header=TRUE, sep=',')
colnames(g)
dim(g)
dimnames(g)[[2]] # another way to get columns name 
chol <- g['chol'] # cholesterol is continuous, so it's easy
gender <- as.factor(g[,'gender']) # but gender isn't.
dm <- as.factor(g[,'dm']) # neither is dm
t <- table(gender) # store the tabulation for further manipulation
addmargins(t) # this will sum up the gender totals to give an overall total and print the results
round(prop.table(t),digits=3) # get proportions rounded to 3dp
round(100*prop.table(t),digits=1) # get %s rounded to 1dp
dm2 <- factor(dm, exclude=NULL) # make new factor from the old one
table(dm2) 
height <- g[,'height']
weight <- g[,'weight']
summary(height)
summary(weight)
height.si <- height*0.0254
weight.si <- weight*0.453592
bmi <- weight.si/height.si^2
bmi_categorised <- ifelse(bmi < 18.5, "underweight", 
                          ifelse(bmi >= 18.5 & bmi <= 25, "normal", 
                                 ifelse(bmi > 25 & bmi <= 30, "overweight", 
                                        ifelse(bmi > 30, "obese", NA)))) 

# check that the bmi_categorised variable has worked  
table(bmi_categorised, exclude = NULL) 
dm_by_bmi_category <- table(bmi_categorised, dm2, exclude = NULL)
dm_by_bmi_category
#with the row percentages 
round(100 * prop.table(dm_by_bmi_category, margin = 1), digits = 1) 
# categroising age group 
age <- g[,'age']
age_categorised <- ifelse(age < 45, "less than 45", 
                          ifelse(age >= 45 & age < 65, "mid age -65", 
                                 ifelse(age >= 65 & age < 75, "old age- 75", 
                                        ifelse(age >= 75, "Very old more than 75 ", NA)))) 

table(age_categorised, exclude = NULL) 
# look how gender is divided in age
gender_by_age_category <- table(age_categorised, gender, exclude = NULL)
gender_by_age_category
round(100 * prop.table(gender_by_age_category, margin = 1), digits = 1) 
round(100 * prop.table(gender_by_age_category, margin = NULL), digits = 1)
round(100 * prop.table(gender_by_age_category, margin = 2), digits = 1) 
# check if grouping is done properly or not 
head(cbind(age_categorised, age))

# Logistic regression 
# with no predictor value 
m <- glm(dm ~ 1, family=binomial (link=logit))
summary(m)
m <- glm(dm ~ age, family=binomial (link=logit))
summary(m)
dm_by_age <- table(age, dm) 
# output the frequencies of diabetes status by age 
freq_table <- prop.table(dm_by_age, margin = 1) 

# calculate the odds of having diabetes 
odds <- freq_table[, "yes"]/freq_table[, "no"] 

# calculate the log odds 
logodds <- log(odds) 

# plot the ages found in the sample against the log odds of having diabetes 
plot(rownames(freq_table), logodds) 

# we need to analyse coefficient as exponetial term 
# for nil perdictor , intercept is exp(-1.7047)
# so we check it that level
exp(-1.7047)
# it means 60/330 = 0.1818 , odd of having diabites over no diabities
# for quiz , its about Dm by location
location <- g[,'location'] # create location 
dm_by_location <- table(location, dm2, exclude = NULL)
# logistic regression 
m <- glm(dm ~ location, family=binomial (link=logit))
summary(m)
exp(-0.1395)


# Multiple logistic regression 
# analyse age data 
summary(age) # continous data summary and distribution of curve 
# plot(age) not the right choice of analyse 
hist(age, breaks = 20) # divides data in 20 buckets 
# smooth histogram : kernel density plots
d <- density(age) 
plot(d,main = "") # gives warnings but the "main" argument suppresses the ugly default title 
# summarising gender
table (gender) # categorical variable 
summary (gender)
plot(gender)
# summarizing bmi 
summary(bmi)
bmi_den <- density(bmi,na.rm=TRUE) # na.rm drops missing values 
plot(bmi_den,main = "")
# on HDL
HDL <-g['hdl'] # not continuous variable , int variable 
# needs to change to float by using as.numeric 
str(HDL) # check the data type of column /data frame 
HDL <- as.numeric(unlist(HDL))
summary(HDL)
HDL_den <- density(HDL,na.rm=TRUE)
plot(HDL_den,main = "")

# cholesterol 
chol <- g['chol']
str(chol)

# analayzing each variable as log odd 
# define the gender variable 
gender <- as.factor(g[,"gender"]) 

# cross tabulation 
dm_by_gender <- table(gender, dm) # not including NA values because there aren't that many 

# proportion of diabetes status by gender 
dm_by_gender_prop <- prop.table(dm_by_gender, margin = 1) 

# calculate the odds of having diabetes by gender 
odds_gender <- dm_by_gender_prop[, "yes"]/dm_by_gender_prop[, "no"] 

# calculate the log odds 
logodds_gender <- log(odds_gender) 

# plot the log odds of having diabetes by gender 
dotchart(logodds_gender)

plot(as.factor(names(logodds_gender)), logodds_gender) 

# with age 

# create a cross tabulation of age and diabetes status  
dm_by_age <- table(age, dm) # not including NA values because there aren't that many 

# output the frequencies of diabetes status by age 
dm_by_age_prop <- prop.table(dm_by_age, margin = 1) 

# calculate the odds of having diabetes 
odds_age <- dm_by_age_prop[, "yes"]/dm_by_age_prop[, "no"] 

# calculate the log odds 
logodds_age <- log(odds_age) 

# plot the ages found in the sample against the log odds of having diabetes 
plot(rownames(dm_by_age_prop), logodds_age) 

# age grouping converting continuous variable to a categorical (ordinal) one  
age_grouped <- ifelse(age < 45, "under 45", 
                      ifelse(age >= 45 & age < 65, "45 - 64",  
                             ifelse(age >= 65 & age < 75, "65 - 74",  
                                    ifelse(age >= 75, "75 or over", NA)))) 

age_grouped <- factor(age_grouped, levels = c("under 45", "45 - 64", "65 - 74", "75 or over")) 



# create a cross tabulation of age and diabetes status  
dm_by_age_grouped <- table(age_grouped, dm) 

# output the frequencies of diabetes status by age 
age_grouped_prop <- prop.table(dm_by_age_grouped, margin = 1) 

# calculate the odds of having diabetes 
odds_age_grouped <- age_grouped_prop[, "yes"]/age_grouped_prop[, "no"] 

# calculate the log odds 
logodds_age_grouped <- log(odds_age_grouped) 

# plot the age groups found in the sample against the log odds of having diabetes 
dotchart(logodds_age_grouped) 

# define chol as a continuous variable 
chol <- g[,"chol"] 


# create a cross tabulation of cholesterol and diabetes status  
dm_by_chol <- table(chol, dm) # not including NA values because there aren't that many 

# output the frequencies of diabetes status by cholesterol 
dm_by_chol_prop <- prop.table(dm_by_chol, margin = 1) 

# calculate the odds of having diabetes 
odds_chol <- dm_by_chol_prop[, "yes"]/dm_by_chol_prop[, "no"] 

# calculate the log odds 
logodds_chol <- log(odds_chol) 

# plot the cholesterol found in the sample against the log odds of having diabetes 
plot(rownames(dm_by_chol_prop), logodds_chol, xlim=c(150, 300)) 

# categorising chol into an ordinal variable 

# https://www.medicalnewstoday.com/articles/315900.php 
chol_categorised <- ifelse(chol < 200, "healthy",  
                           ifelse(chol < 240, "borderline high", 
                                  ifelse(chol >= 240, "high", NA))) 

# make sure that it is treated as a factor/categorical variable and ordering the levels within the factor for the table 
chol_categorised <- factor(chol_categorised, levels = c("healthy", "borderline high", "high")) 




# create a cross tabulation of cholesterol and diabetes status  
dm_by_chol_categorised <- table(chol_categorised, dm) # not including NA values because there aren't that many 

# output the frequencies of diabetes status by cholesterol 
dm_by_chol_categorised_prop <- prop.table(dm_by_chol_categorised, margin = 1) 

# calculate the odds of having diabetes 
odds_chol_categorised <- dm_by_chol_categorised_prop[, "yes"]/dm_by_chol_categorised_prop[, "no"] 

# calculate the log odds 
logodds_chol_categorised <- log(odds_chol_categorised) 

# plot the cholesterol categories found in the sample against the log odds of having diabetes 
dotchart(logodds_chol_categorised)

#bmi 
height <- g[,"height"] 
weight <- g[,"weight"] 
height.si <- height*0.0254 
weight.si <- weight*0.453592 
bmi <- weight.si/height.si^2 


# categorising BMI 

bmi_categorised <- ifelse(bmi < 18.5, "underweight", 
                          ifelse(bmi >= 18.5 & bmi <= 25, "normal", 
                                 ifelse(bmi > 25 & bmi <= 30, "overweight", 
                                        ifelse(bmi > 30, "obese", NA)))) 

# make sure that it is treated as a factor/categorical variable and ordering the levels within the factor for the table 
bmi_categorised <- factor(bmi_categorised, levels = c("underweight", "normal", "overweight","obese")) 

# create a cross tabulation of BMI and diabetes status  
dm_by_bmi_categorised <- table(bmi_categorised, dm) # not including NA values because there aren't that many 

# output the frequencies of diabetes status by BMI 
dm_by_bmi_categorised_prop <- prop.table(dm_by_bmi_categorised, margin = 1) 

# calculate the odds of having diabetes 
odds_bmi_categorised <- dm_by_bmi_categorised_prop[, "yes"]/dm_by_bmi_categorised_prop[, "no"] 

# calculate the log odds 
logodds_bmi_categorised <- log(odds_bmi_categorised) 

# plot the BMI categories found in the sample against the log odds of having diabetes 
dotchart(logodds_bmi_categorised) 

# correlation study
cor.test(x=chol,y=HDL,method='pearson') 
m <- glm(dm ~ age+gender+bmi+HDL, family=binomial (link=logit))
summary(m)
exp(confint(m)) 
# graded Exam 
insurance <- g['insurance']
summary(insurance)
str(insurance) # its int
# convert it into categorical
insurance <- as.factor(insurance)
insurance <- g['insurance']
insurance <- as.factor(insurance)
m <- glm(dm ~ age+bmi+insurance, family=binomial (link=logit))
summary(m)
exp(confint(m))
k <- glm(dm2 ~ age, family= binomial (link=logit))
