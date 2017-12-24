require('mosaic')
require('sqldf')
library('ggplot2')
library('xlsx')
library('corrplot')
library("plyr")
library("car")
library("moments")
library("ggplot2")
library("arm")
library("lme4")
library("caret")
library("devtools")
library("broom")
#detach("package:usdm",unload=TRUE)

# [1] "X"                   "combined_fips"       "votes_dem_2016"      "votes_gop_2016"      "total_votes_2016"   
# [6] "Clinton"             "Trump"               "diff_2016"           "per_point_diff_2016" "state_abbr"         
# [11] "county_name"         "FIPS"                "total_votes_2012"    "votes_dem_2012"      "votes_gop_2012"     
# [16] "county_fips"         "state_fips"          "Obama"               "Romney"              "diff_2012"          
# [21] "per_point_diff_2012" "fips"                "area_name"           "state_abbreviation"  "population2014"     
# [26] "Edu_batchelors"      "White"               "Black"               "Hispanic"            "Income"             
# [31] "Density"             "Poverty"        

#load data
setwd("/Users/hp/documents/R")
votes_raw=read.csv("/users/hp/documents/R/votes.csv",header=TRUE)
#load(file="votes_raw.RData")
votes_raw=votes_raw[votes_raw$state_abbr!="AK",]
votes_raw=rename(votes_raw,c("AGE135214"="Age5minus","AGE295214"="Age18minus","SEX255214"="Female","RHI325214"="Indian","RHI425214"="Asia","RHI525214"="Hawaii","RHI625214"="Multi_race", "RHI825214"="White2","POP715213"="Resident","POP645213"="Foreignborn","VET605213"="Veteran",'LFE305213'='Traveltime','HSG010214'='Housingunits','HSG445213'='Homeownership','HSG096213'='Housingunits2','HSG495213'="Housingunits3","HSD410213"="Households","HSD310213"="Person_per_household",'INC110213'='Household_income',"BZA010213"='Nonfarm','BZA110213'='Nonfarm2','NES010213'='Nonemployer',"SBO001207"="Firms",'SBO315207'="Firms_black","SBO115207"="Firm_indian","SBO215207"="Firm_asia","SBO515207"="Firm_hawaii","SBO415207"="Firm_hispanic","SBO015207"="Firm_woman","MAN450207"="Shipments","WTN220207"="Wholesaler","RTN130207"="Retail","RTN131207"="Retail2","AFN120207"="Sales_af","BPS030214"="Building_permits","LND110210"="Land_area","BZA115213"="Nonfarm3","POP010210"="Population2010R","Clinton"="Clinton_raw","Trump"="Trump_raw","Obama"="Obama_raw","Romney"="Romney_raw"))
votes_raw1=votes_raw[,c(1:25)]
votes_raw2=votes_raw[,c("X","population2014","population2010","Edu_batchelors","White","Black","Hispanic","Income","Density","Poverty","Region","Sub.Region")]
votes=merge(votes_raw1,votes_raw2)
votes$Clinton=-log((1-votes$Clinton_raw)/votes$Clinton_raw)
votes$Trump=-log((1-votes$Trump_raw)/votes$Trump_raw)
votes$Obama=-log((1-votes$Obama_raw)/votes$Obama_raw)
votes$Romney=-log((1-votes$Romney_raw)/votes$Romney_raw)
#names(votes)
#head(votes)
#summary(votes)
#str(votes)
attach(votes)

detach(votes)



#rm(list = ls())




















