################################################################################
###                                                                          ###
###              SGP Configurations for 2018 ELA                             ###
###                                                                          ###
################################################################################

ELA_2018.config <- list(
  ELA.2018_1 = list(
    sgp.content.areas=rep('ELA', 3),
	sgp.panel.years=c('2015', '2016', '2017'),
    sgp.grade.sequences=list(c('3', '4'), c('3', '4', '5'), c('4', '5', '6'), c('5', '6', '7'), c('6', '7', '8'))),
  ELA.2018_2 = list(
    sgp.content.areas=rep('ELA', 2),
	sgp.panel.years=c('2015', '2017'),
    sgp.grade.sequences=list(c('8', '10'))),
  ELA.2018_3 = list(
    sgp.content.areas=rep('ELA', 2),
	sgp.panel.years=c('2016', '2017'),
    sgp.grade.sequences=list(c('10', '11'))))
