################################################################################
###                                                                          ###
###              Prepare and format the 2015 - 2017 SBAC data                ###
###                                                                          ###
################################################################################

### Load required packages
require(data.table)

### Utility functions

strhead <- function (s, n)
{
    if (n < 0)
        substr(s, 1, nchar(s) + n)
    else substr(s, 1, n)
}


###
###		Load 2017 Raw Data
###

#setwd("~/Dropbox (SGP)/SGP/SBAC/")

SBAC_Data_LONG_2015 <- fread("Data/Base_Files/Longit14-15.csv", header = TRUE, colClasses=rep("character", 16))
SBAC_Data_LONG_2016 <- fread("Data/Base_Files/Longit15-16.csv", header = TRUE, colClasses=rep("character", 16))
SBAC_Data_LONG_2017 <- fread("Data/Base_Files/Longit16-17.csv", header = TRUE, colClasses=rep("character", 16))

SBAC_Data_LONG <- rbindlist(list(
  fread("Data/Base_Files/Longit14-15.csv", header = TRUE, colClasses=rep("character", 16))[,YEAR := "2015"],
  fread("Data/Base_Files/Longit15-16.csv", header = TRUE, colClasses=rep("character", 16))[,YEAR := "2016"],
  fread("Data/Base_Files/Longit16-17.csv", header = TRUE, colClasses=rep("character", 16))[,YEAR := "2017"]
))

SBAC_Data_LONG[, STATE := strhead(SBAC_Data_LONG$StudentIdentifier, 2)]

# STATE by YEAR:    SBAC_Data_LONG[, list(N=.N), keyby=c("STATE", "YEAR")]
# GRADE by CONTENT_AREA:     SBAC_Data_LONG[, list(N=.N), keyby=c("GradeLevelWhenAssessed", "Subject")]

setnames(SBAC_Data_LONG, c("StudentIdentifier", "GradeLevelWhenAssessed", "Subject", "ScaleScore"), c("ID", "GRADE", "CONTENT_AREA", "SCALE_SCORE"))
SBAC_Data_LONG[, VALID_CASE := "VALID_CASE"]

SBAC_Data_LONG[CONTENT_AREA=="MATH", CONTENT_AREA:="MATHEMATICS"]

SBAC_Data_LONG[!GRADE %in% 3:12, VALID_CASE := "INVALID_CASE"]

SBAC_Data_LONG[,SCALE_SCORE:=as.numeric(SCALE_SCORE)]
SBAC_Data_LONG[is.na(SCALE_SCORE), VALID_CASE:="INVALID_CASE"]

###   DEMOGRAPHICs

# Sex  SBAC_Data_LONG[, list(N=.N), keyby="Sex"]
SBAC_Data_LONG[Sex=="", Sex:=NA]

SBAC_Data_LONG[, ETHNICITY := as.character(NA)]
SBAC_Data_LONG[HispanicOrLatinoEthnicity == "Yes", ETHNICITY := "Hispanic or Latino"]
SBAC_Data_LONG[AmericanIndianOrAlaskaNative == "Yes", ETHNICITY := "American Indian or Alaska Native"]
SBAC_Data_LONG[BlackOrAfricanAmerican == "Yes", ETHNICITY := "Black or African American"]
SBAC_Data_LONG[White == "Yes", ETHNICITY := "White"]
SBAC_Data_LONG[NativeHawaiianOrOtherPacificIslander %in% c("Yes", "Ye"), ETHNICITY := "Native Hawaiian or Other Pacific Islander"]
SBAC_Data_LONG[Asian == "Yes", ETHNICITY := "Asian"]
SBAC_Data_LONG[DemographicRaceTwoOrMoreRaces %in% c("Yes", "Ye"), ETHNICITY := "Two or More Races"]

SBAC_Data_LONG[, c("HispanicOrLatinoEthnicity", "AmericanIndianOrAlaskaNative", "BlackOrAfricanAmerican", "White", "NativeHawaiianOrOtherPacificIslander", "Asian", "DemographicRaceTwoOrMoreRaces") := NULL]

#     FRL
SBAC_Data_LONG[EconomicDisadvantageStatus %in% c("Yes", "Ye"), EconomicDisadvantageStatus := "Yes"]

#     IDEA
SBAC_Data_LONG[IDEAIndicator %in% c("Yes", "Ye"), IDEAIndicator := "Yes"]

#     LEP
SBAC_Data_LONG[LEPStatus %in% c("Yes", "Ye"), LEPStatus := "Yes"]

# 504Status

SBAC_Data_LONG[Section504Status %in% c("NESNo"), Section504Status := "No"]
SBAC_Data_LONG[Section504Status %in% c("Unk"), Section504Status := "Unknown/Cannot Provide"]


###   Save LONG Data
setkeyv(SBAC_Data_LONG, SGP:::getKey(SBAC_Data_LONG))
setcolorder(SBAC_Data_LONG, c(which(names(SBAC_Data_LONG) %in% key(SBAC_Data_LONG)), which(!names(SBAC_Data_LONG) %in% key(SBAC_Data_LONG))))

save(SBAC_Data_LONG, file="Data/SBAC_Data_LONG.Rdata")
