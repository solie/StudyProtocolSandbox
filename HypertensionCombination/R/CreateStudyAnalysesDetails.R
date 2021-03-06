#' @export
createAnalysesDetails <- function(outputFolder) {

  includedCovariateConceptIds <- c()
  excludedCovariateConceptIds <- readRDS(system.file("settings",
                                                     "htn_med_list",
                                                     package = "HypertensionCombination"))
  
  cohortset <- list(AC30=1330,
                    AD30=1430,
                    CD30=3430,
                    AC180=13180,
                    AD180=14180,
                    CD180=34180,
                    AC365=13365,
                    AD365=14365,
                    CD365=34365)
  comparatorset <- list(AC30=1330,
                        AD30=1430,
                        CD30=3430,
                        AC180=13180,
                        AD180=14180,
                        CD180=34180,
                        AC365=13365,
                        AD365=14365,
                        CD365=34365)
  
  outcomeset <- c(0
                  , 378424, 4004352, 4280726, 133141, 137053, 140480, 380731,
                  381581, 75344,  80809, 376415,  4224118, 4253054, 437409, 199067, 434272, 373478, 140641, 139099,
                  4142905, 195862, 4271016, 375552, 380038, 135473, 138102, 29735, 4153877, 74396, 134870, 74855,
                  200169, 194997,  192367, 4267582, 434872, 4329707, 4288544, 198075
                  ) 
  #any death / #composite + any death / MI/HF/STROKE
  #c(4320,4321, 420, 421, 0,1,2,3,4) 
  #composite + any death / composite + cardiocerebral death / stroke+MI+any death / stroke+MI+cc death/ any death/ cc death/MI/HF/STROKE
  
  dcos1 <- CohortMethod::createDrugComparatorOutcomes(targetId = 1330,
                                                     comparatorId = 1430,
                                                     excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                     outcomeIds = outcomeset)
  dcos1<-list(dcos1)
  
  dcos2 <- CohortMethod::createDrugComparatorOutcomes(targetId = 3430,
                                                      comparatorId = 1430,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos2<-list(dcos2)
  
  dcos3 <- CohortMethod::createDrugComparatorOutcomes(targetId = 3430,
                                                      comparatorId = 1330,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos3<-list(dcos3)
  
  dcos4 <- CohortMethod::createDrugComparatorOutcomes(targetId = 13180,
                                                      comparatorId = 14180,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos4<-list(dcos4)
  
  dcos5 <- CohortMethod::createDrugComparatorOutcomes(targetId = 34180,
                                                      comparatorId = 14180,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos5<-list(dcos5)
  
  dcos6 <- CohortMethod::createDrugComparatorOutcomes(targetId = 34180,
                                                      comparatorId = 13180,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos6<-list(dcos6)
  
  dcos7 <- CohortMethod::createDrugComparatorOutcomes(targetId = 13365,
                                                      comparatorId = 14365,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos7<-list(dcos7)
  
  dcos8 <- CohortMethod::createDrugComparatorOutcomes(targetId = 34365,
                                                      comparatorId = 14365,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos8<-list(dcos8)
  
  dcos9 <- CohortMethod::createDrugComparatorOutcomes(targetId = 34365,
                                                      comparatorId = 13365,
                                                      excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                      outcomeIds = outcomeset)
  dcos9<-list(dcos9)
  
  
  drugComparatorOutcomesList1 <- c(
      dcos1,
      dcos2,
      dcos3)
  
  drugComparatorOutcomesList2 <- c(
      dcos4,
      dcos5,
      dcos6)
  
  drugComparatorOutcomesList3 <- c(
      dcos7,
      dcos8,
      dcos9)
  
  covarSettings <- FeatureExtraction::createCovariateSettings(useCovariateDemographics = TRUE,
                                                              useCovariateDemographicsGender = TRUE,
                                                              useCovariateDemographicsRace = TRUE,
                                                              useCovariateDemographicsEthnicity = TRUE,
                                                              useCovariateDemographicsAge = TRUE, 
                                                              useCovariateDemographicsYear = TRUE,
                                                              useCovariateDemographicsMonth = FALSE,
                                                              useCovariateConditionOccurrence = TRUE,    
                                                              useCovariateConditionOccurrence365d = TRUE,
                                                              useCovariateConditionOccurrence30d = TRUE,
                                                              useCovariateConditionOccurrenceInpt180d = TRUE,
                                                              useCovariateConditionEra = TRUE, 
                                                              useCovariateConditionEraEver = TRUE,
                                                              useCovariateConditionEraOverlap = FALSE,
                                                              useCovariateConditionGroup = TRUE,
                                                              useCovariateConditionGroupMeddra = TRUE,
                                                              useCovariateConditionGroupSnomed = TRUE,
                                                              useCovariateDrugExposure = TRUE, 
                                                              useCovariateDrugExposure365d = TRUE,
                                                              useCovariateDrugExposure30d = TRUE, 
                                                              useCovariateDrugEra = TRUE,
                                                              useCovariateDrugEra365d = TRUE, 
                                                              useCovariateDrugEra30d = TRUE,
                                                              useCovariateDrugEraOverlap = TRUE, 
                                                              useCovariateDrugEraEver = TRUE,
                                                              useCovariateDrugGroup = TRUE, 
                                                              useCovariateProcedureOccurrence = TRUE,
                                                              useCovariateProcedureOccurrence365d = TRUE,
                                                              useCovariateProcedureOccurrence30d = TRUE,
                                                              useCovariateProcedureGroup = TRUE, 
                                                              useCovariateObservation = FALSE,
                                                              useCovariateObservation365d = FALSE, 
                                                              useCovariateObservation30d = FALSE,
                                                              useCovariateObservationCount365d = FALSE, 
                                                              useCovariateMeasurement = FALSE,
                                                              useCovariateMeasurement365d = FALSE, 
                                                              useCovariateMeasurement30d = FALSE,
                                                              useCovariateMeasurementCount365d = FALSE,
                                                              useCovariateMeasurementBelow = FALSE,
                                                              useCovariateMeasurementAbove = FALSE, 
                                                              useCovariateConceptCounts = TRUE,
                                                              useCovariateRiskScores = TRUE, 
                                                              useCovariateRiskScoresCharlson = TRUE,
                                                              useCovariateRiskScoresDCSI = TRUE, 
                                                              useCovariateRiskScoresCHADS2 = FALSE,
                                                              useCovariateRiskScoresCHADS2VASc = FALSE,
                                                              useCovariateInteractionYear = FALSE, 
                                                              useCovariateInteractionMonth = FALSE,
                                                              excludedCovariateConceptIds = excludedCovariateConceptIds,
                                                              includedCovariateConceptIds = includedCovariateConceptIds,
                                                              deleteCovariatesSmallCount = 50)

  getDbCmDataArgs <- CohortMethod::createGetDbCohortMethodDataArgs(studyStartDate = "",
                                                                   studyEndDate = "",
                                                                   excludeDrugsFromCovariates = FALSE,
                                                                   firstExposureOnly = TRUE,
                                                                   removeDuplicateSubjects = TRUE,
                                                                   washoutPeriod = 0,
                                                                   covariateSettings = covarSettings)

  
  createStudyPopArgs1 <- CohortMethod::createCreateStudyPopulationArgs(firstExposureOnly = TRUE,
                                                                       washoutPeriod = 0,
                                                                       removeDuplicateSubjects = TRUE,
                                                                       removeSubjectsWithPriorOutcome = TRUE,
                                                                       minDaysAtRisk = 0,
                                                                       riskWindowStart = 30,
                                                                       addExposureDaysToStart = FALSE,
                                                                       riskWindowEnd = 0,
                                                                       addExposureDaysToEnd = TRUE)
  
  
  createStudyPopArgs2 <- CohortMethod::createCreateStudyPopulationArgs(firstExposureOnly = TRUE,
                                                                       washoutPeriod = 0,
                                                                       removeDuplicateSubjects = TRUE,
                                                                       removeSubjectsWithPriorOutcome = TRUE,
                                                                       minDaysAtRisk = 0,
                                                                       riskWindowStart = 180,
                                                                       addExposureDaysToStart = FALSE,
                                                                       riskWindowEnd = 0,
                                                                       addExposureDaysToEnd = TRUE)
  
  createStudyPopArgs3 <- CohortMethod::createCreateStudyPopulationArgs(firstExposureOnly = TRUE,
                                                                       washoutPeriod = 0,
                                                                       removeDuplicateSubjects = TRUE,
                                                                       removeSubjectsWithPriorOutcome = TRUE,
                                                                       minDaysAtRisk = 0,
                                                                       riskWindowStart = 365,
                                                                       addExposureDaysToStart = FALSE,
                                                                       riskWindowEnd = 0,
                                                                       addExposureDaysToEnd = TRUE)

  # Fixing seed for reproducability:
  createPsArgs <- CohortMethod::createCreatePsArgs(prior = Cyclops::createPrior("laplace",
                                                                                exclude = c(0),
                                                                                useCrossValidation = TRUE),
                                                   control = Cyclops::createControl(noiseLevel = "quiet",
                                                                                    cvType = "auto",
                                                                                    tolerance  = 2e-07,
                                                                                    cvRepetitions = 10,
                                                                                    startingVariance = 0.01,
                                                                                    threads = 5))

  matchOnPsArgs1 <- CohortMethod::createMatchOnPsArgs(caliper = 0.15,
                                                      caliperScale = "standardized",
                                                      maxRatio = 1.0)

  omExcludedConcepts <- excludedCovariateConceptIds
  omIncludedConcepts <- c()
  fitOutcomeModelArgs1 <- CohortMethod::createFitOutcomeModelArgs(modelType = "cox",
                                                                  stratified = TRUE,
                                                                  useCovariates = FALSE,
                                                                  excludeCovariateIds = omExcludedConcepts,
                                                                  includeCovariateIds = omIncludedConcepts)


  cmAnalysis1 <- CohortMethod::createCmAnalysis(analysisId = 30,
                                                description = "Hypertension Combination (risk started after 30days)",
                                                #targetType = 34,
                                                #comparatorType = "BC",
                                                getDbCohortMethodDataArgs = getDbCmDataArgs,
                                                createStudyPopArgs = createStudyPopArgs1,
                                                createPs = TRUE,
                                                createPsArgs = createPsArgs,
                                                matchOnPs = TRUE,
                                                matchOnPsArgs = matchOnPsArgs1,
                                                computeCovariateBalance = TRUE,
                                                fitOutcomeModel = TRUE,
                                                fitOutcomeModelArgs = fitOutcomeModelArgs1)
  
  cmAnalysis2 <- CohortMethod::createCmAnalysis(analysisId = 180,
                                                description = "Hypertension Combination (risk started after 180days)",
                                                #targetType = 34,
                                                #comparatorType = "BC",
                                                getDbCohortMethodDataArgs = getDbCmDataArgs,
                                                createStudyPopArgs = createStudyPopArgs2,
                                                createPs = TRUE,
                                                createPsArgs = createPsArgs,
                                                matchOnPs = TRUE,
                                                matchOnPsArgs = matchOnPsArgs1,
                                                computeCovariateBalance = TRUE,
                                                fitOutcomeModel = TRUE,
                                                fitOutcomeModelArgs = fitOutcomeModelArgs1)
  
  cmAnalysis3 <- CohortMethod::createCmAnalysis(analysisId = 365,
                                                description = "Hypertension Combination (risk started after 365days)",
                                                #targetType = 34,
                                                #comparatorType = "BC",
                                                getDbCohortMethodDataArgs = getDbCmDataArgs,
                                                createStudyPopArgs = createStudyPopArgs3,
                                                createPs = TRUE,
                                                createPsArgs = createPsArgs,
                                                matchOnPs = TRUE,
                                                matchOnPsArgs = matchOnPsArgs1,
                                                computeCovariateBalance = TRUE,
                                                fitOutcomeModel = TRUE,
                                                fitOutcomeModelArgs = fitOutcomeModelArgs1)

  
  cmAnalysisList1 <- list(cmAnalysis1)
  cmAnalysisList2 <- list(cmAnalysis2)
  cmAnalysisList3 <- list(cmAnalysis3)
#  cmAnalysisList <- list(cmAnalysis1, cmAnalysis2)
#  cmAnalysisList <- list(cmAnalysis1,
#                         cmAnalysis2,
#                         cmAnalysis3,
#                         cmAnalysis4,
#                         cmAnalysis5,
#                         cmAnalysis6,
#                         cmAnalysis7,
#                         cmAnalysis8,
#                         cmAnalysis9,
#                         cmAnalysis10)

  CohortMethod::saveCmAnalysisList(cmAnalysisList1, file.path(outputFolder, "cmAnalysisList1.txt"))
  CohortMethod::saveCmAnalysisList(cmAnalysisList2, file.path(outputFolder, "cmAnalysisList2.txt"))
  CohortMethod::saveCmAnalysisList(cmAnalysisList3, file.path(outputFolder, "cmAnalysisList3.txt"))
  CohortMethod::saveDrugComparatorOutcomesList(drugComparatorOutcomesList1,
                                               file.path(outputFolder,
                                                         "drugComparatorOutcomesList1.txt"))
  CohortMethod::saveDrugComparatorOutcomesList(drugComparatorOutcomesList2,
                                               file.path(outputFolder,
                                                         "drugComparatorOutcomesList2.txt"))
  CohortMethod::saveDrugComparatorOutcomesList(drugComparatorOutcomesList3,
                                               file.path(outputFolder,
                                                         "drugComparatorOutcomesList3.txt"))
  
}
