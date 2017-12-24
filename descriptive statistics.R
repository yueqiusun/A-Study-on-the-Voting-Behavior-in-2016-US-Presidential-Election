
# [1] "X"                   "combined_fips"       "votes_dem_2016"      "votes_gop_2016"      "total_votes_2016"   
# [6] "Clinton"             "Trump"               "diff_2016"           "per_point_diff_2016" "state_abbr"         
# [11] "county_name"         "FIPS"                "total_votes_2012"    "votes_dem_2012"      "votes_gop_2012"     
# [16] "county_fips"         "state_fips"          "Obama"               "Romney"              "diff_2012"          
# [21] "per_point_diff_2012" "fips"                "area_name"           "state_abbreviation"  "population2014"     
# [26] "Edu_batchelors"      "White"               "Black"               "Hispanic"            "Income"             
# [31] "Density"             "Poverty"        


#descriptive statistics
favstats(Clinton_raw)
favstats(Trump_raw)
favstats(Clinton)
favstats(Trump)
# hist(Clinton_raw,breaks=30)
# hist(Trump_raw)

#histogram
png(filename = "Clinton_raw_hist.png",
    width = 4800, height = 6000, units = "px", pointsize = 12,
    bg = "white",  res = 1000)
hist(Clinton_raw,breaks=30)
dev.off()

png(filename = "Trump_raw_hist.png",
    width = 4800, height = 6000, units = "px", pointsize = 12,
    bg = "white",  res = 1000)
hist(Trump_raw,breaks=30)
dev.off()

skewness(Clinton_raw)
skewness(Trump_raw)


png(filename = "Clinton_hist.png",
    width = 4800, height = 6000, units = "px", pointsize = 12,
    bg = "white",  res = 1000)
hist(Clinton,breaks=25)
dev.off()

png(filename = "Trump_hist.png",
    width = 4800, height = 6000, units = "px", pointsize = 12,
    bg = "white",  res = 1000)
hist(Trump,breaks=25)
dev.off()

skewness(Clinton)
skewness(Trump)

png(filename = "Clinton_scatter.png",
    width = 4000, height = 3000, units = "px", 
    bg = "white",  res = 500)
p1 = ggplot(votes, aes(x = population2014, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p2 = ggplot(votes, aes(x = Edu_batchelors, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p3 = ggplot(votes, aes(x = White, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p4 = ggplot(votes, aes(x = Black, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p5 = ggplot(votes, aes(x = Hispanic, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p6 = ggplot(votes, aes(x = Income, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p7 = ggplot(votes, aes(x = Density, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p8 = ggplot(votes, aes(x = Poverty, y = Clinton)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
multiplot(p1, p2, p3, p4, p5, p6, p7, p8,cols=4)
dev.off()

png(filename = "Trump_scatter.png",
    width = 4000, height = 3000, units = "px", 
    bg = "white",  res = 500)
p9 = ggplot(votes, aes(x = population2014, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p10 = ggplot(votes, aes(x = Edu_batchelors, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p11 = ggplot(votes, aes(x = White, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p12 = ggplot(votes, aes(x = Black, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p13 = ggplot(votes, aes(x = Hispanic, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p14 = ggplot(votes, aes(x = Income, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p15 = ggplot(votes, aes(x = Density, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
p16 = ggplot(votes, aes(x = Poverty, y = Trump)) + geom_point(alpha=.5) + geom_smooth( se = TRUE)
multiplot(p9, p10, p11, p12, p13, p14, p15, p16,cols=4)
dev.off()




#Region and Sub.Region
png(filename = "Region_plot.png",
    width = 4000, height = 3000, units = "px", 
    bg = "white",  res = 500)
layout(matrix(c(1,2)),2,1)
plot(Region,Clinton,cex.axis=1.2,main="Clinton versus Region")
plot(Region,Trump,cex.axis=1.2,main="Trump versus Region")

dev.off()

png(filename = "Sub.Region_plot.png",
    width = 4000, height = 3000, units = "px", 
    bg = "white",  res = 500)
layout(matrix(c(1,2)),2,1)
plot(Sub.Region,Clinton,cex.axis=0.42,main="Clinton versus Sub.Region")
plot(Sub.Region,Trump,cex.axis=0.42,main="Trump versus Sub.Region")

dev.off()




