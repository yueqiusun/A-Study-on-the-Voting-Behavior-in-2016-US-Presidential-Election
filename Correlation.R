png(filename = "corr_pearson.png",
    width = 4000, height = 4000, units = "px", pointsize = 12,
    bg = "white",  res = 500)
votes.correlations <- subset(votes, select=c(Romney, Obama, Trump, Clinton, population2014,Edu_batchelors,White,Black,Hispanic,Income,Density,Poverty))
vcor<-cor(votes.correlations,method="pearson")

corrplot::corrplot(vcor)
corrplot::corrplot(vcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45, 
         addCoef.col="black", addcolorlabel="no")
dev.off()

png(filename = "corr_spearman.png",
    width = 4000, height = 4000, units = "px", pointsize = 12,
    bg = "white",  res = 500)
votes.correlations <- subset(votes, select=c(Romney, Obama, Trump, Clinton, population2014,Edu_batchelors,White,Black,Hispanic,Income,Density,Poverty))
vcor<-cor(votes.correlations,method="spearman")
corrplot::corrplot(vcor)
corrplot::corrplot(vcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45, 
         addCoef.col="black", addcolorlabel="no")
dev.off()



#cor.test(Clinton,population2014,method="pearson")$p.value
#cor.test(Clinton,Poverty,method="pearson")




# votes.correlations <- subset(votes, select=c(Romney, Obama, Trump, Clinton, population2014,Edu_batchelors,White,Black,Hispanic,Income,Density,Poverty))
# vcor<-cor(votes.correlations,method="pearson")
# 
# corrplot(vcor)
# corrplot(vcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45, 
#          addCoef.col="black", addcolorlabel="no")
# 
# 

# 
# votes.correlations <- subset(votes, select=c(Romney, Obama, Trump, Clinton, population2014,Edu_batchelors,White,Black,Hispanic,Income,Density,Poverty))
# vcor<-cor(votes.correlations,method="spearman")
# corrplot(vcor)
# corrplot(vcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45, 
#          addCoef.col="black", addcolorlabel="no")