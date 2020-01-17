#######################################################################
###
### Script to read in EdFact 2017-2018 data and calculate weights
###
#######################################################################

### Load libraries

require(data.table)


### Load data sets

EdFacts_MATH_2016_2017 <- fread("Data/Weighting_Files/math-participation-lea-sy2016-17.csv")
EdFacts_ELA_2016_2017 <- fread("Data/Weighting_Files/rla-participation-lea-sy2016-17.csv")


### Select out variables

states.to.select <- c("CALIFORNIA", "DELAWARE", "HAWAII", "IDAHO", "MONTANA", "NORTH DAKOTA", "OREGON", "SOUTH DAKOTA", "VERMONT", "WASHINGTON")
variables.to.select.ela <- c("STNAM", "ALL_RLA03NUMPART_1617", "ALL_RLA04NUMPART_1617", "ALL_RLA05NUMPART_1617", "ALL_RLA06NUMPART_1617", "ALL_RLA07NUMPART_1617", "ALL_RLA08NUMPART_1617",
                                "ECD_RLA03NUMPART_1617", "ECD_RLA04NUMPART_1617", "ECD_RLA05NUMPART_1617", "ECD_RLA06NUMPART_1617", "ECD_RLA07NUMPART_1617", "ECD_RLA08NUMPART_1617",
                                "MWH_RLA03NUMPART_1617", "MWH_RLA04NUMPART_1617", "MWH_RLA05NUMPART_1617", "MWH_RLA06NUMPART_1617", "MWH_RLA07NUMPART_1617", "MWH_RLA08NUMPART_1617",
                                "MHI_RLA03NUMPART_1617", "MHI_RLA04NUMPART_1617", "MHI_RLA05NUMPART_1617", "MHI_RLA06NUMPART_1617", "MHI_RLA07NUMPART_1617", "MHI_RLA08NUMPART_1617",
                                "MAS_RLA03NUMPART_1617", "MAS_RLA04NUMPART_1617", "MAS_RLA05NUMPART_1617", "MAS_RLA06NUMPART_1617", "MAS_RLA07NUMPART_1617", "MAS_RLA08NUMPART_1617",
                                "MBL_RLA03NUMPART_1617", "MBL_RLA04NUMPART_1617", "MBL_RLA05NUMPART_1617", "MBL_RLA06NUMPART_1617", "MBL_RLA07NUMPART_1617", "MBL_RLA08NUMPART_1617")
variables.to.select.math <- c("STNAM", "ALL_MTH03NUMPART_1617", "ALL_MTH04NUMPART_1617", "ALL_MTH05NUMPART_1617", "ALL_MTH06NUMPART_1617", "ALL_MTH07NUMPART_1617", "ALL_MTH08NUMPART_1617",
                                "ECD_MTH03NUMPART_1617", "ECD_MTH04NUMPART_1617", "ECD_MTH05NUMPART_1617", "ECD_MTH06NUMPART_1617", "ECD_MTH07NUMPART_1617", "ECD_MTH08NUMPART_1617",
                                "MWH_MTH03NUMPART_1617", "MWH_MTH04NUMPART_1617", "MWH_MTH05NUMPART_1617", "MWH_MTH06NUMPART_1617", "MWH_MTH07NUMPART_1617", "MWH_MTH08NUMPART_1617",
                                "MHI_MTH03NUMPART_1617", "MHI_MTH04NUMPART_1617", "MHI_MTH05NUMPART_1617", "MHI_MTH06NUMPART_1617", "MHI_MTH07NUMPART_1617", "MHI_MTH08NUMPART_1617",
                                "MAS_MTH03NUMPART_1617", "MAS_MTH04NUMPART_1617", "MAS_MTH05NUMPART_1617", "MAS_MTH06NUMPART_1617", "MAS_MTH07NUMPART_1617", "MAS_MTH08NUMPART_1617",
                                "MBL_MTH03NUMPART_1617", "MBL_MTH04NUMPART_1617", "MBL_MTH05NUMPART_1617", "MBL_MTH06NUMPART_1617", "MBL_MTH07NUMPART_1617", "MBL_MTH08NUMPART_1617")


### Filter data based upon variables

EdFacts_MATH_2016_2017 <- EdFacts_MATH_2016_2017[, variables.to.select.math, with=FALSE]
EdFacts_ELA_2016_2017 <- EdFacts_ELA_2016_2017[, variables.to.select.ela, with=FALSE]

#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH04NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH05NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH06NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH07NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH08NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA03NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA04NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA05NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA06NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA07NUMPART_1617), na.rm=TRUE))]
#EdFacts_ELA_2016_2017[,list(SUM=sum(as.numeric(ALL_RLA08NUMPART_1617), na.rm=TRUE))]

#EdFacts_MATH_2016_2017[,list(SUM=100*sum(as.numeric(ECD_MTH03NUMPART_1617), na.rm=TRUE)/sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE))]




### Filter data based upon states

EdFacts_MATH_2016_2017 <- EdFacts_MATH_2016_2017[STNAM %in% states.to.select]
EdFacts_ELA_2016_2017 <- EdFacts_ELA_2016_2017[STNAM %in% states.to.select]


### Summaries for counts

#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH04NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH05NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH06NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH07NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH08NUMPART_1617), na.rm=TRUE)), keyby="STNAM"]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH04NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH05NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH06NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH07NUMPART_1617), na.rm=TRUE))]
#EdFacts_MATH_2016_2017[,list(SUM=sum(as.numeric(ALL_MTH08NUMPART_1617), na.rm=TRUE))]

### Summaries for economically disadvantaged.

#100*EdFacts_MATH_2016_2017[,sum(as.numeric(ECD_MTH03NUMPART_1617), na.rm=TRUE)]/EdFacts_MATH_2016_2017[,sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE)]

### Summaries for white student percentage

100*EdFacts_MATH_2016_2017[,sum(as.numeric(MWH_MTH03NUMPART_1617), na.rm=TRUE)]/EdFacts_MATH_2016_2017[,sum(as.numeric(ALL_MTH03NUMPART_1617), na.rm=TRUE)]
