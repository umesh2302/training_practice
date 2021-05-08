g <- read.csv(file = "simulated HF mort data for GMPH (1K) final.csv",
              header=TRUE, sep=',')
dim (g)

head(g)

#install.packages("survival")
#install.packages("ggplot")

library(survival) # this is the cornerstone command for survival analysis in R
library(ggplot2) # newer package that does nice plots

gender <- as.factor(g[,"gender"]) # R calls categorical variables factors
fu_time <- g[,"fu_time"] # continuous variable (numeric) 
death <- g[,"death"] # binary variable (numeric) 
km_fit <- survfit(Surv(fu_time, death) ~ 1)

plot(km_fit)
summary(km_fit, times = c(1:7,30,60,90*(1:10))) 
km_gender_fit <- survfit(Surv(fu_time, death) ~ gender) 

plot(km_gender_fit)
survdiff(Surv(fu_time, death) ~ gender, rho=0) 
age_65plus <- ifelse(g[,"age"]>=65,1,0) # dichotomise age
table(age_65plus, exclude = NULL) # inspect the numbers - always a good idea
age_65plus
age <- g[,'age']
survdiff(Surv(fu_time, death) ~ age_65plus, rho=0)
#install.packages("survminer")
library(survminer)
cox <- coxph(Surv(fu_time, death) ~ ethnicgroup, data = g) # take variables straight from g
summary(cox)

ethnicgroup <- factor(g[,"ethnicgroup"]) # can also use "as.factor" rather than "factor"
fu_time <- g[,"fu_time"]
death <- g[,"death"]

cox <- coxph(Surv(fu_time, death) ~ ethnicgroup)
summary(cox)

levels(ethnicgroup)<-c(levels(ethnicgroup),"8") # add level 8 to the factor

ethnicgroup[is.na(ethnicgroup)] <- "8" # Change NA to "None"
cox <- coxph(Surv(fu_time, death) ~ ethnicgroup) 
 summary(cox) 
 
 ########## 
 age <- g[, 'age']
 gender <- factor(g[,'gender'])
 prior_dnas <- factor(g[,'prior_dnas']) # not a factor but as a continous variable
 COPD <- factor(g[,'copd'])
 copd <- factor(g[,'copd'])
 prior_dnas <- g[,'prior_dnas']
 cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + prior_dnas + ethnicgroup)
 summary(cox)
 quintile <-factor(g[,'quintile'])
 cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + quintile + ethnicgroup) 
 summary (cox)
 
 quintile <- relevel(quintile, ref = 2) # quintile 1 as the ref cat again
 
 cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + quintile + ethnicgroup)
 
 summary(cox)
 
 quintile_5groups <- g[,'quintile'] # best start with the original data set, not from "quintile" 
 
 quintile_5groups[quintile_5groups==0] <- 5 
 
 quintile_5groups <- factor(quintile_5groups) 
 
 table(quintile_5groups, exclude=NULL) 
 
 cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + quintile_5groups + ethnicgroup) 
 
 summary(cox) 
 quintile_5groups <- g[,'quintile'] 
 
 quintile_5groups[quintile_5groups==0] <- NA # set the zeroes to missing 
 
 quintile_5groups <- factor(quintile_5groups) 
 
 table(quintile_5groups, exclude=NULL) 
 cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + quintile_5groups + ethnicgroup) 
 
 summary(cox) 
 
 
 summary(cox)
 fit <- coxph(Surv(fu_time, death) ~ gender) # fit the desired model
 
 temp <- cox.zph(fit)# apply the cox.zph function to the desired model
 
 print(temp) # display the results
 
 plot(temp) # plot the curves
 
 km_fit <- survfit(Surv(fu_time, death) ~ gender) 
 
 autoplot(km_fit)
 plot(km_fit, xlab = "time", ylab = "Survival probability") 
 res.cox <- coxph(Surv(fu_time, death) ~ age) 
 ggcoxdiagnostics(res.cox, type = "dfbeta", 
                  linear.predictions = FALSE, ggtheme = theme_bw())
 res.cox <- coxph(Surv(fu_time, death) ~ age) 
 ggcoxdiagnostics(res.cox, type = "deviance", 
                  linear.predictions = FALSE, ggtheme = theme_bw()) 
 ggcoxfunctional(Surv(fu_time, death) ~ age + log(age) + sqrt(age)) 
 #### time as a factor to locate hazard proportion as time factor 
 
 fit <- coxph(Surv(fu_time, death) ~ gender + tt(gender)) # "tt" is the time-transform function 
 summary(fit) 
 
 #### full model run 
 
 # make the other covariates 
 
 ihd <- factor(g[,'ihd']) 
 
 valvular <- factor(g[,'valvular_disease']) 
 
 pvd <- factor(g[,'pvd']) 
 
 stroke <- factor(g[,'stroke']) 
 
 copd<- factor(g[,'copd'])
 
 pneumonia <- factor(g[,'pneumonia']) 
 
 ht <- factor(g[,'hypertension'])
 
 renal <- factor(g[,'renal_disease']) 
 
 ca <- factor(g[,'cancer']) 
 
 mets <- factor(g[,'metastatic_cancer']) 
 
 mental_health <- factor(g[,'mental_health']) 
 
 los <- g[,'los']
 
 prior_dna <- g[,'prior_dnas']
 
 # generate cognitive impairment variable (senility and dementia combined)
 
 cog_imp <- as.factor(ifelse(g$dementia == 1 | g$senile == 1, 1, 0))
 
 # run the full model 
 
 cox <- coxph(Surv(fu_time, death) ~ age + gender + ethnicgroup + ihd + 
                      
                      valvular + pvd + stroke + copd + pneumonia + ht + renal + 
                      
                      ca + mets + mental_health + cog_imp + los + prior_dna) 
 
 summary(cox) 
# only significant variables
  cox <- coxph(Surv(fu_time, death) ~ age + gender + valvular + pneumonia + mets + cog_imp) 
 
 summary(cox) 
 
 fit <- coxph(Surv(fu_time, death) ~ age + gender + valvular + pneumonia + 
                      
                      mets + cog_imp) # test them all in the same model 
 
 temp <- cox.zph(fit)  
 
 print(temp)
 