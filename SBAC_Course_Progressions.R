################################################################################
###                                                                          ###
###                Identify 2017 Course Progressions for SBAC                ###
###                                                                          ###
################################################################################

library(SGP)  # Version 1.7-X.X or later
library(data.table)

###  Load SBAC Data

load("Data/SBAC_Data_LONG.Rdata")

###  Run courseProgressionSGP by content area subsets of the SBAC_Data_LONG

ela.prog<- courseProgressionSGP(SBAC_Data_LONG[CONTENT_AREA %in% "ELA"], lag.direction="BACKWARD", year='2017')
math.prog <- courseProgressionSGP(SBAC_Data_LONG[CONTENT_AREA %in% "MATH"], lag.direction="BACKWARD", year='2017')


####
####     Mathematics
####

sum(math.prog$BACKWARD[['2017']]$MATH.04[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.03"]$COUNT)   #  200767
sum(math.prog$BACKWARD[['2017']]$MATH.05[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.04"]$COUNT)   #  196247
sum(math.prog$BACKWARD[['2017']]$MATH.06[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.05"]$COUNT)   #  191210
sum(math.prog$BACKWARD[['2017']]$MATH.07[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.06"]$COUNT)   #  188854
sum(math.prog$BACKWARD[['2017']]$MATH.08[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.07"]$COUNT)   #  185982

sum(math.prog$BACKWARD[['2017']]$MATH.09[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.08"]$COUNT)   #  66  !!!  ???
sum(math.prog$BACKWARD[['2017']]$MATH.10[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.09"]$COUNT)   #  10  !!!  ???
sum(math.prog$BACKWARD[['2017']]$MATH.11[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.10"]$COUNT)   #  6744
sum(math.prog$BACKWARD[['2017']]$MATH.11[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.11"]$COUNT)   #  449241 (repeaters) !!!  ???
sum(math.prog$BACKWARD[['2017']]$MATH.12[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="MATH.11"]$COUNT)   #  2656


####
####     ELA
####

sum(ela.prog$BACKWARD[['2017']]$ELA.04[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.03"]$COUNT)   #  200770
sum(ela.prog$BACKWARD[['2017']]$ELA.05[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.04"]$COUNT)   #  196287
sum(ela.prog$BACKWARD[['2017']]$ELA.06[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.05"]$COUNT)   #  191327
sum(ela.prog$BACKWARD[['2017']]$ELA.07[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.06"]$COUNT)   #  189400
sum(ela.prog$BACKWARD[['2017']]$ELA.08[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.07"]$COUNT)   #  186743

sum(ela.prog$BACKWARD[['2017']]$ELA.09[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.08"]$COUNT)   #  3  !!!  ???
sum(ela.prog$BACKWARD[['2017']]$ELA.10[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.09"]$COUNT)   #  7  !!!  ???
sum(ela.prog$BACKWARD[['2017']]$ELA.11[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.10"]$COUNT)   #  14536
sum(ela.prog$BACKWARD[['2017']]$ELA.11[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.11"]$COUNT)   #  450741 (repeaters) !!!  ???
sum(ela.prog$BACKWARD[['2017']]$ELA.12[CONTENT_AREA_by_GRADE_PRIOR_YEAR.1=="ELA.11"]$COUNT)   #  2633
