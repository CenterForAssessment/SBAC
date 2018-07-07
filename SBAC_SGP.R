################################################################################
###                                                                          ###
###                   SBAC SGP analyses for 2018                             ###
###                                                                          ###
################################################################################

### Load SGP Package

require(SGP)
require(data.table)


### Load data

load("Data/SBAC_Data_LONG.Rdata")


### Load configurations

source("SGP_CONFIG/2017/ELA.R")
source("SGP_CONFIG/2018/ELA.R")
source("SGP_CONFIG/2017/MATHEMATICS.R")
source("SGP_CONFIG/2018/MATHEMATICS.R")


SBAC_CONFIG <- c(
	ELA_2016.config,
	ELA_2017.config,
	MATHEMATICS_2016.config,
	MATHEMATICS_2017.config)


###  updateSGP

SBAC_SGP <- abcSGP(
			sgp_object = SBAC_Data_LONG,
			steps=c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
#			steps=c("prepareSGP", "analyzeSGP", "combineSGP", "summarizeSGP", "visualizeSGP", "outputSGP"),
			sgp.percentiles=TRUE,
			sgp.projections=TRUE,
			sgp.projections.lagged=TRUE,
			sgp.percentiles.baseline=FALSE,
			sgp.projections.baseline=FALSE,
			sgp.projections.lagged.baseline=FALSE,
			simulate.sgps=FALSE,
			save.intermediate.results=FALSE,
			sgp.config=SBAC_CONFIG,
			sgp.target.scale.scores=TRUE,
			sgPlot.demo.report=TRUE,
			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(TAUS=20, PERCENTILES=1, PROJECTIONS=10, LAGGED_PROJECTIONS=10, SGP_SCALE_SCORE_TARGETS=10, GA_PLOTS=1, SG_PLOTS=1)))


### Save results

save(SBAC_SGP, file="Data/SBAC_SGP.Rdata")
