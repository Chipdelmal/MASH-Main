###############################################################################
#       __  ___      ____  _____________________
#      /  |/  /     / __ )/  _/_  __/ ____/ ___/
#     / /|_/ /_____/ __  |/ /  / / / __/  \__ \
#    / /  / /_____/ /_/ // /  / / / /___ ___/ /
#   /_/  /_/     /_____/___/ /_/ /_____//____/
#
#   MASH-MICRO
#   MBITES-BRO: Bouts
#   MASH-MICRO Team
#   September 7, 2017
#
###############################################################################


#################################################################
# MBITES-BRO: Dwell Times
#################################################################

#' MBITES-BRO: Exponential Timing for \code{MosquitoFemale}
#'
#' Method for exponentially-distributed bout lengths (model mosquitoes as a Markov process).
#'  * This method is bound to \code{MosquitoFemale$timingExponential()}.
#'
mbitesBRO_timingExponential <- function(){
  if(self$isActive()){
    duration = switch(private$state,
      B = {private$FemalePopPointer$get_MBITES_PAR("B_time")},
      R = {private$FemalePopPointer$get_MBITES_PAR("R_time")},
      O = {private$FemalePopPointer$get_MBITES_PAR("O_time")},
      M = {private$FemalePopPointer$get_MBITES_PAR("M_time")},
      S = {private$FemalePopPointer$get_MBITES_PAR("S_time")}
    )
    private$tNext = private$tNow + rexp(n=1,rate=1/duration)
  }
}

#' MBITES-BRO: Gamma Timing for \code{MosquitoFemale}
#'
#' Method for Gamma-distributed bout lengths (model mosquitoes as a semi-Markov process).
#'  * This method is bound to \code{MosquitoFemale$timingExponential()}.
#'
mbitesBRO_timingGamma <- function(){
  if(self$isActive()){
    duration = switch(private$state,
      B = {private$FemalePopPointer$get_MBITES_PAR("B_time")},
      R = {private$FemalePopPointer$get_MBITES_PAR("R_time")},
      O = {private$FemalePopPointer$get_MBITES_PAR("O_time")},
      M = {private$FemalePopPointer$get_MBITES_PAR("M_time")},
      S = {private$FemalePopPointer$get_MBITES_PAR("S_time")}
    )
    private$tNext = private$tNow + rgamma(n=1,shape=private$FemalePopPointer$get_MBITES_PAR("gammaShape"),rate=(1/duration)*private$FemalePopPointer$get_MBITES_PAR("gammaShape"))
  }
}


#################################################################
#  MBITES-BRO: Post-bout Landing, House Entering, and Resting
#
#  HOUSE ENTERING & RESTING BEHAVIOR:
#  At the end of the search bout, attempt bout, or after Egg
#  laying a mosquito has entered the area around a feeding
#  station and either rested or attempted to rest:
#    l) Leave the area
#    r) Reattempt Without Resting;
#    v) Rest on vegetation
#    w) Rest on the Outside wall of a structure
#    i) Rest on the Inside wall of a structure
#
#################################################################

#' MBITES-BRO: Return Site Type \code{MosquitoFemale}
#'
#' Method to return integer corresponding to site type of \code{\link{MicroSite}} this mosquito is currently at.
#'  Site Types:
#'  * 1: peri-domestic site
#'  * 0: not peri-domestic site
#'
#'  * This method is bound to \code{MosquitoFemale$get_MySiteType()}.
#'
#' @return vector of landing spot weights
mbitesBRO_get_MySiteType <- function(){
  switch(private$pSetNow,
    f = {return(private$LandscapePointer$get_FeedingSites(private$locNow)$get_siteType())},
    l = {return(private$LandscapePointer$get_AquaSites(private$locNow)$get_siteType())},
    m = {return(private$LandscapePointer$get_MatingSites(private$locNow)$get_siteType())},
    s = {return(private$LandscapePointer$get_SugarSites(private$locNow)$get_siteType())},
    {stop("illegal point set for M-BITES")}
  )
}

#' MBITES-BRO: Return Landing Spot Weights for \code{MosquitoFemale}
#'
#' Method for return landing spot weights based on behavioral state of mosquito.
#'  * This method is bound to \code{MosquitoFemale$get_WTS()}.
#'
#' @return vector of landing spot weights
mbitesBRO_get_WTS <- function(){
  switch(private$state,
    B = private$FemalePopPointer$get_MBITES_PAR("B_wts"),
    R = private$FemalePopPointer$get_MBITES_PAR("R_wts"),
    O = private$FemalePopPointer$get_MBITES_PAR("O_wts"),
    M = private$FemalePopPointer$get_MBITES_PAR("M_wts"),
    S = private$FemalePopPointer$get_MBITES_PAR("S_wts"),
    {stop(cat("illegal behavioral state: ",private$state,"\n",sep=""))}
  )
}

#' MBITES-BRO: Generate New Landing Spot for \code{MosquitoFemale}
#'
#' Method for return a new landing spot based on behavioral state of mosquito and weights from \code{\link{mbitesBRO_get_WTS}}.
#' New landing spots generated at the end of the search bout, attempt bout, or after oviposition a mosquito has entered
#' the area around a feeding site and either rested or attempted to rest. If the site is not a \code{\link{FeedingSite}} or peri-domestic the mosquito always rests on vegetation.
#'  * i: rest on the inside wall of a structure
#'  * w: rest on the outside wall of a structure
#'  * v: rest on vegetation
#'  * r: reattempt without resting
#'  * l: leave the area
#'
#'  * This method is bound to \code{MosquitoFemale$newSpot()}.
#'
#' @return integer value corresponding to new landing spot
mbitesBRO_newSpot <- function(){
  if(self$get_MySiteType() == 1){
    probs = private$FemalePopPointer$get_MBITES_PAR("InAndOut")[private$lspot,] * self$get_WTS()
    sample(x = private$FemalePopPointer$get_MBITES_PAR("lspot"),size = 1,prob = probs)
  } else {
    return("v")
  }
}

#' MBITES-BRO: Attempt to Enter a House for \code{MosquitoFemale}
#'
#' Method to simulate attempted house entry for mosquito, and call appropriate events if the mosquito enters.
#'  * This method is bound to \code{MosquitoFemale$enterHouse()}.
#'
mbitesBRO_enterHouse <- function(){
  if(runif(1) < private$LandscapePointer$get_FeedingSites(private$locNow)$get_enterP()){
    # mosquito is inside of house
  } else {
    # mosquito is not inside of house
    private$lspot = self$newSpot()
    self$surviveFlight()
    if(private$lspot == "i"){
      Recall()
    }
  }
}

#' MBITES-BRO: Land After Flight \code{MosquitoFemale}
#'
#' Mosquito lands after a flight (choose a landing spot), which may cause various events.
#' This function always calls \code{\link{mbitesBRO_newSpot}} and may call \code{\link{mbitesBRO_enterHouse}}
#' Landing spots include:
#'  * i: 1 rest on the inside wall of a structure
#'  * w: 2 rest on the outside wall of a structure
#'  * v: 3 rest on vegetation
#'  * r: 4 reattempt without resting
#'  * l: 5 leave the area
#'
#'  * This method is bound to \code{MosquitoFemale$restingSpot()}.
#'
mbitesBRO_restingSpot <- function(){
  if(self$isActive()){
    oldSpot = private$lspot
    private$lspot = self$newSpot() # choose new lspot
    if(oldSpot != "i" & private$lspot == "i"){
      self$enterHouse() # enterHouse
    }
  }
}


#################################################################
# MBITES-BRO: Blood Feeding Bout
#################################################################

#' MBITES-BRO: Blood Feeding Bout \code{MosquitoFemale}
#'
#' A mosquito performs a blood feeding bout (all actions taken launch to launch when blood feeding required).
#'  * This method is bound to \code{MosquitoFemale$boutB()}.
#'
mbitesBRO_boutB <- function(){

  if(self$isAlive()){
    # check success
    if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("B_succeed")){
      self$chooseHost() # MBITES-BRO-ChooseHost.R
    } else {
      private$hostID = 0L
    }

    if(private$hostID > 0){
      self$humanEncounter() # MBITES-BRO-HostEncounter.R
    } else if(private$hostID == -1){
      self$zooEncounter() # MBITES-BRO-HostEncounter.R
    } else if(private$hostID == 0){
      return(NULL)
    } else {
      stop("illegal hostID value")
    }
  }

}


#################################################################
# MBITES-BRO: Post-Prandial Resting Bout
#################################################################

#' MBITES-BRO: Post-Prandial Resting Bout \code{MosquitoFemale}
#'
#' A mosquito performs a post-prandial resting bout (all actions taken launch to launch when resting required).
#'  * This method is bound to \code{MosquitoFemale$boutR()}.
#'
mbitesBRO_boutR <- function(){

  if(self$isAlive()){
    if(private$FemalePopPointer$get_MBITES_PAR("REFEED")){
      if(runif(1) < self$pReFeed()){
        private$stateNew = "B"
      } else {
        private$stateNew = "O"
      }
    } else {
      private$stateNew = "O"
    }
  }

}


#################################################################
# MBITES-BRO: Egg Laying Bout
#################################################################

#' MBITES-BRO: Egg Laying Bout \code{\link{MosquitoFemale}}
#'
#' A mosquito performs a oviposition bout (all actions taken launch to launch when oviposition required).
#'  * This method is bound to \code{MosquitoFemale$boutO()}.
#'
#' @md
mbitesBRO_boutO <- function(){
  if(self$isAlive()){
    self$layEggs()
  }
}

#' MBITES-BRO: Lay Eggs for 'Emerge' \code{\link{MosquitoFemale}}
#'
#' During an oviposition bout \code{\link{mbitesBRO_boutO}}, lay eggs (this is just a filler to clear out the \code{batch} field of the mosquito; egg laying is not implemented in any modules relying on "Emerge" Aquatic Ecology module)
#'  * This method is bound to \code{MosquitoFemale$layEggs()}.
#'
#' @md
mbitesBRO_layEggs_Emerge <- function(){
  if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("O_succeed")){
    private$batch = 0
    private$stateNew = "B"
  }
}

#' MBITES-BRO: Lay Eggs for 'EL4P' \code{\link{MosquitoFemale}}
#'
#' During an oviposition bout \code{\link{mbitesBRO_boutO}}, lay eggs for 'EL4P' module of Aquatic Ecology.
#'  * This method is bound to \code{MosquitoFemale$layEggs()}.
#'
#' @md
mbitesBRO_layEggs_EL4P <- function(){
  if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("O_succeed")){
    private$LandscapePointer$get_AquaSites(private$locNow)$get_EggQ()$add_EggQ(N_new=private$batch,tOviposit_new=private$tNow,genotype_new=1L)
    private$batch = 0
    private$stateNew = "B"
  }
}


#################################################################
# MBITES-BRO: Generic Bout
#################################################################

#' MBITES-BRO: One Bout \code{MosquitoFemale}
#'
#' Mosquito behavior has a finite set of states (state space of model), within which there are certain biological functions that are always evaluated.
#' A bout is the actions taken by a mosquito between a launch and landing; \code{mbitesBRO_oneBout} handles all the biological imperatives that occur during a bout,
#' while specialized bout action methods handle the events that occur due to the purpose of the bout.
#'  * \code{\link{mbitesBRO_boutB}}: blood feeding bout
#'  * \code{\link{mbitesBRO_boutR}}: resting feeding bout
#'  * \code{\link{mbitesBRO_boutO}}: oviposition bout
#'
#' The generic bout runs necessary updates of timing, state, survival, energetics, and queue checks prior to calling the nested
#' specific bout action, and checks that the mosquito is alive/active before calling the bout. It updates \code{tNext} and \code{stateNew}.
#'
#' This corresponds to the following Gillespie-style algorithm:
#'
#' 1. tNow is set to tNext from previous bout
#' 2. moveMe: movement between point classes (if needed)
#' 3. boutFun: run bout function
#' 4. run energetics and check if alive
#' 5. run restingSpot and check if alive
#' 6. run surviveResting/surviveFlight and check if alive
#' 7. update tNext
#' 8. update state to stateNew which is determined in the bout
#'
#'  * This method is bound to \code{MosquitoFemale$oneBout()}.
#'
#' @md
mbitesBRO_oneBout <- function(){

  # update time and state
  private$tNow = private$tNext # update time
  private$state = private$stateNew # update current state
  self$timing() # update tNext

  # movement
  self$moveMe()

  # landing spot
  self$restingSpot()

  # bout
  switch(private$state,
    B = {self$boutB()},
    R = {self$boutR()},
    O = {self$boutO()},
    M = {self$boutM()},
    S = {self$boutS()},
    {stop(cat("illegal behavioral state: ",private$state,"\n",sep=""))}
  )

  # energetics
  if(private$FemalePopPointer$get_MBITES_PAR("SUGAR")){
    self$sugarEnergetics()  # MBITES-Generic-Energetics.R
  }

  # survival
  self$surviveResting()     # MBITES-Survival.R
  self$surviveFlight()      # MBITES-Survival.R

  # log history
  private$history$historyTrack(privateEnv = private, alive = self$isAlive())

}


#################################################################
# MBITES-BRO: Simulation
#################################################################

#' MBITES-BRO: Run Simulation for \code{\link{MosquitoFemale}}
#'
#' Run the M-BITES life cycle simulation algorithm while alive and has not overrun time in enclosing \code{\link{MicroTile}}.
#' This method calls \code{\link{mbitesBRO_oneBout}} to simulate each life stage.
#'  * This method is bound to \code{MosquitoFemale$MBITES()}.
#'
#' @md
mbitesBRO_oneMosquito_MBITES <- function(){

  # run algorithm while alive and has not overrun tile time
  while(private$tNext < private$TilePointer$get_tNow() & private$stateNew != "D"){
    self$oneBout()
  }

  # if mosquito is dead output data if asked and remove it from the enclosing storage object
  if(private$stateNew == "D"){
    self$writeAndDelete(conHist = private$TilePointer$get_FemaleHistoryCon(), conPath = private$TilePointer$get_MosquitoPathogenCon())
  }

}

#' MBITES-BRO: Run Simulation for \code{\link{MosquitoPopFemale}}
#'
#' Run the M-BITES life cycle simulation algorithm while alive and has not overrun time in enclosing \code{\link{MicroTile}}.
#' This method calls \code{\link{mbitesBRO_oneMosquito_MBITES}} one each living mosquito sequentially.
#'  * This method is bound to \code{MosquitoPopFemale$MBITES()}.
#'
#' @md
mbitesBRO_Pop_MBITES <- function(){

  private$pop$apply(tag="MBITES",returnVal=FALSE)

}
