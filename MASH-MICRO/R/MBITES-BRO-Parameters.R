###############################################################################
#       __  ___      ____  _____________________
#      /  |/  /     / __ )/  _/_  __/ ____/ ___/
#     / /|_/ /_____/ __  |/ /  / / / __/  \__ \
#    / /  / /_____/ /_/ // /  / / / /___ ___/ /
#   /_/  /_/     /_____/___/ /_/ /_____//____/
#
#   MASH-MICRO
#   MBITES-BRO: Parameters
#   MASH-MICRO Team
#   September 7, 2017
#
###############################################################################

#################################################################
# M-BITES BRO Parameters
#################################################################

#' Generate Parameters for M-BITES 'BRO' Module
#'
#' Generate named list of parameters used throughout MICRO/M-BITES. All arguments have default values which are listed below before the definition.
#'
#' @param B_wts landing spot weights
#' @param R_wts landing spot weights
#' @param O_wts landing spot weights
#' @param InAndOut matrix of landing probabilities
#' @param gammaShape shape parameter for Gamma distributed dwell times; if gammaShape = 1 same as exponential, variance decreases as gammaShape becomes large (see \code{\link{mbitesBRO_timingGamma}})
#' @param B_surv Blood feeding bout baseline survival probability \code{\link{mbitesGeneric_surviveFlight}}
#' @param B_succeed Blood feeding bout probability of success (if succeed call \code{\link{mbitesGeneric_chooseHost}})
#' @param B_time Blood feeding bout mean time elapsed (in days); alternatively the waiting time until next state transition
#' @param surviveH human host encounter survival probability of initial encounter (proceed to probe)
#' @param probeH human host encounter probability undeterred and begin probing
#' @param surviveprobeH human host encounter survival probability of probing
#' @param feedH human host encounter probability to successfully blood feed
#' @param surviveZ non-human host encounter survival probability of initial encounter (proceed to feed)
#' @param feedZ non-human host encounter probability to successfully blood feed
#' @param R_surv Post Prandial Resting bout baseline survival probability \code{\link{mbitesGeneric_surviveFlight}}
#' @param R_time Post Prandial Resting bout mean time elapsed (in days); alternatively the waiting time until next state transition
#' @param O_surv Egg Laying bout baseline survival probability \code{\link{mbitesGeneric_surviveFlight}}
#' @param O_succeed Egg Laying bout probability of success (if successfull call \code{layEggs})
#' @param O_time Egg Laying bout mean time elapsed (in days); alternatively the waiting time until next state transition
#' @param bm.a shape param for bloodmeal size (see \code{\link{mbitesGeneric_rBloodMealSize}})
#' @param bm.b shape param for bloodmeal size (see \code{\link{mbitesGeneric_rBloodMealSize}})
#' @param REFEED control boolean for refeeding behavior during resting bout
#' @param rf.a exp param for refeeding as function of bmSize (see \code{\link{mbitesGeneric_pReFeed}})
#' @param rf.b exp param for refeeding as function of bmSize (see \code{\link{mbitesGeneric_pReFeed}})
#' @param OVERFEED control boolean for overfeeding during \code{\link{mbitesBRO_BloodMeal}}
#' @param of.a exp param for overfeeding as function of bmSize (see \code{\link{mbitesGeneric_pOverFeed}})
#' @param of.b exp param for overfeeding as function of bmSize (see \code{\link{mbitesGeneric_pOverFeed}})
#' @param SENESCE control boolean for senesce mortality during \code{\link{mbitesGeneric_surviveFlight}}
#' @param sns.a exp param for senescence (see \code{\link{mbitesGeneric_pSenesce}})
#' @param sns.b exp param for senescence (see \code{\link{mbitesGeneric_pSenesce}})
#' @param TATTER control boolean for wing tattering during \code{\link{mbitesGeneric_surviveFlight}}
#' @param ttsz.p zero-inflation for tattering damage (see \code{\link{mbitesGeneric_WingTattering}})
#' @param ttsz.a shape param for tattering damage (see \code{\link{mbitesGeneric_WingTattering}})
#' @param ttsz.b shape param for tattering damage (see \code{\link{mbitesGeneric_WingTattering}})
#' @param ttr.a exp param for tattering survival (see \code{\link{mbitesGeneric_pTatter}})
#' @param ttr.b exp param for tattering survival (see \code{\link{mbitesGeneric_pTatter}})
#' @param SUGAR logical; enable sugar bouts and energetics (see \code{\link{mbitesBROS_boutS}} and \code{\link{mbitesGeneric_sugarEnergetics}})
#' @param S_succeed probability to successfully locate sugar source and replenish energy in sugar feeding bout
#' @param S_time average duration of time spent in sugar feeding state (unconditional on next state)
#' @param S_wts landing spot weights
#' @param S.u per-bout energy expenditure
#' @param S.a shape parameter of per-bout probability of survival as function of energy reserves
#' @param S.b shape parameter of per-bout probability of survival as function of energy reserves
#' @param S.sa shape parameter of probability to queue sugar bout as function of energy reserves
#' @param S.sb shape parameter of probability to queue sugar bout as function of energy reserves
#' @param MATE logical; enable mating (see \code{\link{mbitesBROM_boutM}})
#' @param M_succeed probability to successfully locate a mating swarm and call \code{\link{mbitesGeneric_chooseMate}}
#' @param M_time average duration of time spent in mating state (unconditional on next state)
#' @param M_wts landing spot weights
#' @param bs.m mean of normally-distributed egg batch size (used in \code{\link{mbitesGeneric_rBatchSizeNorm}})
#' @param bs.v standard deviation of normally-distributed egg batch size (used in \code{\link{mbitesGeneric_rBatchSizeNorm}})
#' @param maxBatch maximum egg batch size (used in \code{\link{mbitesGeneric_rBatchSizeBms}})
#' @param emt.m mean of normally-distributed egg batch maturation time (used in \code{\link{mbitesGeneric_rEggMaturationTimeNorm}})
#' @param emt.v standard deviation of normally-distributed egg batch maturation time (used in \code{\link{mbitesGeneric_rEggMaturationTimeNorm}})
#' @param eggT minimum time to egg maturation
#' @param eggP minimum provision to produce eggs
#' @param energyPreG pre-gonotrophic energy requirement
#' @param preGsugar amount of energy a sugar meal contributes to energyPreG (pre-gonotrophic energy requirement)
#' @param preGblood amount of energy a blood meal contributes to energyPreG (pre-gonotrophic energy requirement)
#' @param PfEIP entomological inoculation period for Plasmodium falciparum during \code{MosquitoFemale$probing()}
#' @param Q human blood index (used in \code{\link{mbitesCohort_chooseHost}})
#' @return a named list of parameters
#' @examples
#' MBITES.BRO.Parameters()
#' @export
MBITES.BRO.Parameters <- function(

  ##########################################
  # Landing Spot
  ##########################################
  B_wts = rep(1,5),
  R_wts = rep(1,5),
  O_wts = rep(1,5),
  InAndOut = matrix(data = c(4,2,2,1,6,
                             2,1,1,1,4,
                             1,1,1,1,2,
                             0,0,0,0,1,
                             1,1,2,1,0),
                             nrow = 5,ncol = 5,byrow = TRUE,dimnames = list(c("i","w","v","r","l"),c("i","w","v","r","l"))),


  ##########################################
  # Timing
  ##########################################
  gammaShape = 8,

  ##########################################
  # Blood Feeding Bout
  ##########################################

  B_surv = 0.85, # baseline survival for surviveFlight
  B_succeed = 0.8, # prob success (for boutB)
  B_time = 3/4,  # Blood Feed Attempt . Mean Time Elapsed (in Days)

  ##########################################
  # Host Encounter
  ##########################################

  # human host
  surviveH = 1, # survival probability for initial encounter (survive to probe)
  probeH = 1, # probability that undeterred during probing
  surviveprobeH = 1, # survival probability for host probing
  feedH = 1, # probability to successfully feed

  #animal host
  surviveZ = 1, # survival probability for initial encounter (survive to feed)
  feedZ = 1, # probability to successfully feed

  ##########################################
  # Post Prandial Resting
  ##########################################
  R_surv = 0.9, # baseline survival for surviveFlight
  R_time = 0.8,  # Resting . Mean Time Elapsed (in Days)

  ##########################################
  # Egg Laying Bout
  ##########################################
  O_surv = 0.80, # baseline survival for surviveFlight
  O_succeed = .7,   # Egg Laying Attempt . Prob Success
  O_time = 1.3,    # Egg Laying Attempt . Mean Time Elapsed

  ##########################################
  # BloodMeal
  ##########################################
  bm.a = 7.5, #shape param for bloodmeal size
  bm.b = 2.5, #shape param for bloodmeal size

  ##########################################
  # ReFeed
  ##########################################
  REFEED = FALSE,
  rf.a = 60, #exp param for refeeding as function of bmSize
  rf.b = 5e3, #exp param for refeeding as function of bmSize

  ##########################################
  # Overfeed
  ##########################################
  OVERFEED = FALSE,
  of.a = 5, #exp param for overfeeding as function of bmSize
  of.b = 5e3, #exp param for overfeeding as function of bmSize

  ##########################################
  # SENESCE
  ##########################################
  SENESCE = FALSE,
  sns.a = 0.1, #exp param for senescence
  sns.b = 100, #exp param for senescence

  ##########################################
  # TATTER
  ##########################################
  TATTER = FALSE,
  ttsz.p = 0.5, #zero-inflation for tattering damage
  ttsz.a = 5, #shape param for tattering damage
  ttsz.b = 95, #shape param for tattering damage
  ttr.a = 15, #exp param for tattering survival
  ttr.b = 500, #exp param for tattering survival

  ##########################################
  # SUGAR
  ##########################################
  SUGAR = FALSE,
  S_succeed = 0.95,
  S_time = 0.25,
  S_wts = rep(1,5),
  S_surv = 0.9,
  S.u = 1/5,
  S.a = 20,
  S.b = 10,
  S.sa = 15,
  S.sb = 5,

  ##########################################
  # MATING
  ##########################################
  MATE = FALSE,
  M_succeed = 0.95,
  M_time = 0.5,
  M_wts = rep(1,5),
  M_surv = 0.95,

  ##########################################
  # Reproduction & Development
  ##########################################
  bs.m = 30, # used in mbitesGeneric_rBatchSizeNorm
  bs.v = 5, # used in mbitesGeneric_rBatchSizeNorm
  maxBatch = 30, # maximum egg batch size (used in mbitesGeneric_rBatchSizeBms)
  emt.m = 3, # used in mbitesGeneric_rEggMaturationTimeNorm
  emt.v = 1, # used in mbitesGeneric_rEggMaturationTimeNorm
  eggT = 0, # minimum time to egg maturation
  eggP = 0, # minimum provision to produce eggs
  energyPreG = 0, # pre-gonotrophic energy requirement
  preGsugar = 0, # sugar units to fill pre-gonotrophic energy requirement
  preGblood = 0, # blood units to fill pre-gonotrophic energy requirement

  ##########################################
  # Pathogen Transmission
  ##########################################

  PfEIP = 12,

  ##########################################
  # MBITES-BRO-Cohort Parameters
  ##########################################

  Q = 0.9 # human blood index

){

  out = list(

    B_wts = B_wts,
    R_wts = R_wts,
    O_wts = O_wts,
    InAndOut =InAndOut,
    gammaShape = gammaShape,

    ##########################################
    # Blood Feeding Bout
    ##########################################

    B_surv = B_surv, # baseline survival for surviveFlight
    B_succeed = B_succeed, # prob success (for boutB)
    B_time = B_time,  # Blood Feed Attempt . Mean Time Elapsed (in Days)

    ##########################################
    # Host Encounter
    ##########################################

    # human host
    surviveH = surviveH, # survival probability for initial encounter (survive to probe)
    probeH = probeH, # probability that undeterred during probing
    surviveprobeH = surviveprobeH, # survival probability for host probing
    feedH = feedH, # probability to successfully feed

    #animal host
    surviveZ = surviveZ, # survival probability for initial encounter (survive to feed)
    feedZ = feedZ, # probability to successfully feed

    ##########################################
    # Post Prandial Resting
    ##########################################
    R_surv = R_surv, # baseline survival for surviveFlight
    R_time = R_time,  # Resting . Mean Time Elapsed (in Days)

    ##########################################
    # Egg Laying Bout
    ##########################################
    O_surv = O_surv, # baseline survival for surviveFlight
    O_succeed = O_succeed,   # Egg Laying Attempt . Prob Success
    O_time = O_time,    # Egg Laying Attempt . Mean Time Elapsed

    ##########################################
    # BloodMeal
    ##########################################
    bm.a = bm.a, #shape param for bloodmeal size
    bm.b = bm.b, #shape param for bloodmeal size

    ##########################################
    # ReFeed
    ##########################################
    REFEED = REFEED,
    rf.a = rf.a, #exp param for refeeding as function of bmSize
    rf.b = rf.b, #exp param for refeeding as function of bmSize

    ##########################################
    # Overfeed
    ##########################################
    OVERFEED = OVERFEED,
    of.a = of.a, #exp param for overfeeding as function of bmSize
    of.b = of.b, #exp param for overfeeding as function of bmSize

    ##########################################
    # SENESCE
    ##########################################
    SENESCE = SENESCE,
    sns.a = sns.a, #exp param for senescence
    sns.b = sns.b, #exp param for senescence

    ##########################################
    # TATTER
    ##########################################
    TATTER = TATTER,
    ttsz.p = ttsz.p, #zero-inflation for tattering damage
    ttsz.a = ttsz.a, #shape param for tattering damage
    ttsz.b = ttsz.b, #shape param for tattering damage
    ttr.a = ttr.a, #exp param for tattering survival
    ttr.b = ttr.b, #exp param for tattering survival

    ##########################################
    # Reproduction & Development
    ##########################################
    bs.m = bs.m,
    bs.v = bs.v,
    maxBatch = maxBatch,
    emt.m = emt.m,
    emt.v = emt.v,
    eggT = eggT, # minimum time to egg maturation
    eggP = eggP, # minimum provision to produce eggs
    energyPreG = energyPreG, # pre-gonotrophic energy requirement
    preGsugar = preGsugar,
    preGblood = preGblood,

    ##########################################
    # Pathogen Transmission
    ##########################################
    PfEIP = PfEIP,

    ##########################################
    # MBITES-BRO-Cohort
    ##########################################
    Q = Q,

    ##########################################
    # State Space
    ##########################################

    stateSpace = c("B","R","O"),
    initState = "B",
    lspot = c("i","w","v","r","l"),
    Fstate = c(B=0,R=0,O=0)

  )

  out$SUGAR = SUGAR
  out$MATE = MATE

  ##########################################
  # SUGAR
  ##########################################
  if(SUGAR){
    out$stateSpace = c(out$stateSpace,"S")
    out$Fstate = c(out$Fstate,c(S=0))
    out$S_succeed = S_succeed
    out$S_time = S_time
    out$S_wts = S_wts
    out$S_surv = S_surv
    out$S.u = S.u
    out$S.a = S.a
    out$S.b = S.b
    out$S.sa = S.sa
    out$S.sb = S.sb
  }

  ##########################################
  # MATING
  ##########################################
  if(MATE){
    out$stateSpace = c(out$stateSpace,"M")
    out$initState = "M"
    out$Fstate = c(out$Fstate,c(M=0))
    out$M_succeed = M_succeed
    out$M_time = M_time
    out$M_wts = M_wts
    out$M_surv = M_surv
  }

  return(out)

}
