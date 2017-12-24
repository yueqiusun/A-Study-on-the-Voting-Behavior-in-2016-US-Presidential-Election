
#scale varaibles

votes.scaled=cbind(votes[,c(1:25)],scale(votes[,c("population2014","population2010","Edu_batchelors","White","Black",
                                                  "Hispanic","Income","Density","Poverty")]),votes[c("Clinton","Trump",
                                                                                            "Region","Sub.Region")])
attach(votes.scaled)
detach(votes.scaled)
#regression for Clinton
votes.x=votes.scaled[,c("population2014","population2010","Edu_batchelors","White","Black",
                        "Hispanic","Income","Density","Poverty")]
regression1.Clinton =lm(Clinton ~ population2014+Edu_batchelors+White+Black+Hispanic+Income+Density+Poverty)
# layout(matrix(c(1,2,3,4),2,2))
# plot(regression.Clinton)
summary(regression1.Clinton)
AIC(regression1.Clinton)
BIC(regression1.Clinton)

regression2.Clinton =lm(Clinton ~ population2014+Edu_batchelors+White+Black+Hispanic+Density+Poverty)
#layout(matrix(c(1,2,3,4),2,2))
#plot(regression.Clinton)
summary(regression2.Clinton)
AIC(regression2.Clinton)
BIC(regression2.Clinton)

mixreg1.Clinton=lmer(Clinton ~ population2014+Edu_batchelors+White+Black+Hispanic+Income+Density+Poverty
                     +(1|Region), REML = FALSE)
# layout(matrix(c(1,2,3,4),2,2))
# plot(mixreg1.Clinton)
summary(mixreg1.Clinton)
AIC(mixreg1.Clinton)
BIC(mixreg1.Clinton)
coef(mixreg1.Clinton)
#write.csv(coef(mixreg1.Clinton)$Region,"coef_mixreg1.csv")

mixreg2.Clinton=lmer(Clinton ~ population2014+Edu_batchelors+White+Black+Hispanic+Income+Density+Poverty
                     +(1|Sub.Region),REML = FALSE)
#layout(matrix(c(1,2,3,4),2,2))
#plot(mixreg2.Clinton)
summary(mixreg2.Clinton)
AIC(mixreg2.Clinton)
BIC(mixreg2.Clinton)
#write.csv(coef(mixreg2.Clinton)$Sub.Region,"coef_mixreg2.csv")

#residual plot for Clinton
png(filename = "Residuals Plot.png",
    width = 4800, height = 3700, units = "px", pointsize = 12,
    bg = "white",  res = 800)
par(mar=c(2,2,2,2))
layout(matrix(c(1,2,3,4),2,2))
plot(residuals(regression1.Clinton),main="Residuals Plot of Model 1",xlab="Index",ylab="Residuals",ylim=c(-2,2))
plot(residuals(regression2.Clinton),main="Residuals Plot of Model 2",xlab="Index",ylab="Residuals",ylim=c(-2,2))
plot(residuals(mixreg1.Clinton),main="Residuals Plot of Model 3",xlab="Index",ylab="Residuals",ylim=c(-2,2))
plot(residuals(mixreg2.Clinton),main="Residuals Plot of Model 4",xlab="Index",ylab="Residuals",ylim=c(-2,2))
dev.off()

#vif

vif(regression1.Clinton)
vif(regression2.Clinton)










#regression for Trump

regression.Trump =lm(Trump ~ population2014+Edu_batchelors+White+Black+Hispanic+Income+Density+Poverty)
layout(matrix(c(1,2,3,4),2,2))
plot(regression.Trump)
summary(regression.Trump)
AIC(regression.Trump)

mixreg1.Trump=lmer(Trump ~ population2014+Edu_batchelors+White+Black+Hispanic+Income+Density+Poverty
                     +(1|state_abbreviation), REML = FALSE)
layout(matrix(c(1,2,3,4),2,2))
plot(mixreg1.Trump)
summary(mixreg1.Trump)
AIC(mixreg1.Trump)

mixreg2.Trump=lmer(Trump ~ Edu_batchelors+White+Black+Hispanic+Income+Poverty+(1|state_abbreviation), REML = FALSE)
layout(matrix(c(1,2,3,4),2,2))
plot(mixreg2.Trump)
summary(mixreg2.Trump)
AIC(mixreg2.Trump)


mixreg3.Trump=lmer(Trump ~ Edu_batchelors+White+Black+Hispanic+Poverty+(1|state_abbreviation), REML = FALSE)
layout(matrix(c(1,2,3,4),2,2))
plot(mixreg2.Trump)
summary(mixreg2.Trump)
AIC(mixreg2.Trump)

#other things












