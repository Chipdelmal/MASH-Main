###############################################################################
#       __  ___      ____  _____________________
#      /  |/  /     / __ )/  _/_  __/ ____/ ___/
#     / /|_/ /_____/ __  |/ /  / / / __/  \__ \
#    / /  / /_____/ /_/ // /  / / / /___ ___/ /
#   /_/  /_/     /_____/___/ /_/ /_____//____/
#
#   MASH-MICRO
#   MBITES-BRO: Host Encounter
#   MASH-MICRO Team
#   September 7, 2017
#
###############################################################################

#################################################################
#   Human Host Encounter
#################################################################

#' MBITES-BRO: Human Host Encounter for \code{\link{MosquitoFemale}}
#'
#' After calling \code{\link{mbitesGeneric_chooseHost}}, the mosquito encounters the human host and attempts to feed.
#'  * This method is bound to \code{MosquitoFemale$humanEncounter()}.
#' @md
mbitesGeneric_humanEncounter <- function(){
  if(runif(1) < 1-private$FemalePopPointer$get_MBITES_PAR("surviveH")){ # does not survive to probe
    private$stateNew = "D"
  } else { # survives to probe

    if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("probeH")){ # undeterred
      self$probing() # PATHOGEN-XX-Methods.R
      if(runif(1) < 1-private$FemalePopPointer$get_MBITES_PAR("surviveprobeH")){ # does not survive probing
        private$stateNew = "D"
      } else { # survives probing

        if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("feedH")){ # successfully begins feeding
          self$BloodMeal() # MBITES-BRO-Energetics.R
          self$feeding() # PATHOGEN-XX-Methods.R
          private$history$historyFeed(privateEnv = private) # MOSQUITO-History.hpp
          private$stateNew = "R"
        }

      }

    }

  }

}


#################################################################
#   Non-human Host Encounter
#################################################################

#' MBITES-BRO: Non-Human Host Encounter for \code{\link{MosquitoFemale}}
#'
#' After calling \code{\link{mbitesGeneric_chooseHost}}, the mosquito encounters the non-human host and attempts to feed.
#'  * This method is bound to \code{MosquitoFemale$zooEncounter()}.
#' @md
mbitesGeneric_zooEncounter <- function(){

  if(runif(1) < 1-private$FemalePopPointer$get_MBITES_PAR("surviveZ")){ # does not survive to feed
    private$stateNew = "D"
  } else { # survives to feed

    if(runif(1) < private$FemalePopPointer$get_MBITES_PAR("feedZ")){ # successfully begins feeding
      self$BloodMeal() # MBITES-BRO-Energetics.R
      private$history$historyFeed(privateEnv = private) # MOSQUITO-History.hpp
      private$stateNew = "R"
    }

  }

}


#################################################################
#   Probing & Infection
#################################################################

# Due to the different design of the R6/C++ OOP version of MASH-MICRO, all
# host probing and infection functions are moved to their respective PATHOGEN
# method files PATHOGEN-XX-Methods.R

# MosquitoFemale$ProbeHost() will be defined generically based on module chosen.
