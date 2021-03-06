###############################################################################
#       __  ___      ____  _____________________
#      /  |/  /     / __ )/  _/_  __/ ____/ ___/
#     / /|_/ /_____/ __  |/ /  / / / __/  \__ \
#    / /  / /_____/ /_/ // /  / / / /___ ___/ /
#   /_/  /_/     /_____/___/ /_/ /_____//____/
#
#   MASH-MICRO
#   MBITES-BRO: Setup
#   MASH-MICRO Team
#   September 7, 2017
#
###############################################################################

#################################################################
# Initialize Methods and Fields (Setup)
#################################################################

#' MBITES-BRO: Initialize Additional Methods & Fields in \code{\link{MosquitoPopFemale}} and \code{\link{MosquitoFemale}}
#'
#' Initialize M-BITES BRO (Blood Feeding, Resting, Oviposition) lifecycle model.
#'
#' @param overwrite overwrite methods
#' @param aquaModule character in "emerge" or "EL4P"
#' @param timing character in "exponential", "gamma", "weibull"
#' @examples
#' MBITES.BRO.Setup()
#' @export
MBITES.BRO.Setup <- function(
  overwrite = TRUE,
  SUGAR = FALSE,
  MATE = FALSE,
  aquaModule = "emerge",
  timing = "exponential"
){

    cat("initializing M-BITES BRO module\n",sep="")

    #################################################################
    # MBITES-BRO-Sugar.R
    #################################################################

    if(SUGAR){
      cat("sugar feeding enabled\n")
      MosquitoFemale$set(which = "public",name = "boutS",
                value = mbitesBROS_boutS, overwrite = overwrite
      )
    }

    #################################################################
    # MBITES-BRO-Mating.R
    #################################################################

    if(MATE){
      cat("mating behavior enabled\n")
      MosquitoFemale$set(which = "public",name = "boutM",
                value = mbitesBROM_boutM, overwrite = overwrite
      )
    }

    #################################################################
    # MBITES-BRO-Bouts.R
    #################################################################

    switch(timing,
      exponential = {
        MosquitoFemale$set(which = "public",name = "timing",
                  value = mbitesBRO_timingExponential,
                  overwrite = overwrite
        )
      },
      gamma = {
        MosquitoFemale$set(which = "public",name = "timing",
                  value = mbitesBRO_timingGamma,
                  overwrite = overwrite
        )
      },
      weibull = {
        stop("sean hasn't derived semi-Markov mosquito processes based on weibull distributed waiting times yet. maybe when his days exceed 24 hours.")
      },
      {stop(cat("unrecognized entry for timing, expected character in 'exponential', 'gamma', 'weibull', got: ",timing,"\n",sep=""))}
    )

    MosquitoFemale$set(which = "public",name = "get_MySiteType",
              value = mbitesBRO_get_MySiteType,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "get_WTS",
              value = mbitesBRO_get_WTS,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "newSpot",
              value = mbitesBRO_newSpot,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "enterHouse",
              value = mbitesBRO_enterHouse,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "restingSpot",
              value = mbitesBRO_restingSpot,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "boutB",
              value = mbitesBRO_boutB,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "boutR",
              value = mbitesBRO_boutR,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "boutO",
              value = mbitesBRO_boutO,
              overwrite = overwrite
    )

    switch(aquaModule,
      emerge = {
        MosquitoFemale$set(which = "public",name = "layEggs",
                  value = mbitesBRO_layEggs_Emerge,
                  overwrite = overwrite
        )
      },
      EL4P = {
        MosquitoFemale$set(which = "public",name = "layEggs",
                  value = mbitesBRO_layEggs_EL4P,
                  overwrite = overwrite
        )
      },
      {stop("unrecognized Aquatic Ecology module")}
    )

    MosquitoFemale$set(which = "public",name = "oneBout",
              value = mbitesBRO_oneBout,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "MBITES",
              value = mbitesBRO_oneMosquito_MBITES,
              overwrite = overwrite
    )

    MosquitoPopFemale$set(which = "public",name = "MBITES",
              value = mbitesBRO_Pop_MBITES,
              overwrite = overwrite
    )

    #################################################################
    # MBITES-BRO-Energetics.R
    #################################################################

    MosquitoFemale$set(which = "public",name = "BloodMeal",
              value = mbitesBRO_BloodMeal,
              overwrite = overwrite
    )

    #################################################################
    # MBITES-BRO-Survival.R
    #################################################################

    MosquitoFemale$set(which = "public",name = "get_surviveFlightProb",
              value = mbitesBRO_get_surviveFlightProb,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "get_restHaz",
              value = mbitesBRO_get_restHaz,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "restingSpot",
              value = mbitesBRO_restingSpot,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "boutB",
              value = mbitesBRO_boutB,
              overwrite = overwrite
    )

    MosquitoFemale$set(which = "public",name = "boutR",
              value = mbitesBRO_boutR,
              overwrite = overwrite
    )


}
