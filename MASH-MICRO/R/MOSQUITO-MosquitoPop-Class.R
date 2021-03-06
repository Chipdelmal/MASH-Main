###############################################################################
#
#       __  _______  _____ ____  __  ________________
#      /  |/  / __ \/ ___// __ \/ / / /  _/_  __/ __ \
#     / /|_/ / / / /\__ \/ / / / / / // /  / / / / / /
#    / /  / / /_/ /___/ / /_/ / /_/ // /  / / / /_/ /
#   /_/  /_/\____//____/\___\_\____/___/ /_/  \____/
#
#   MASH-MICRO
#   MICRO: MosquitoPop Class Definitions
#   MASH-MICRO Team
#   September 7, 2017
#
###############################################################################


###############################################################################
# MosquitoPopFemale: Class Definition
###############################################################################

#' MosquitoPopFemale Class Definition
#'
#' im a class!
#'
#' @docType class
#' @format An \code{\link{R6Class}} generator object
#' @keywords R6 class
#'
#' @section **Constructor**:
#'  * argument: im an agument!
#'
#' @section **Methods**:
#'  * method: im a method!
#'
#' @section **Fields**:
#'  * field: im a field!
#'
#' @export
MosquitoPopFemale <- R6::R6Class(classname = "MosquitoPopFemale",
                       portable = TRUE,
                       cloneable = FALSE,
                       lock_class = FALSE,
                       lock_objects = FALSE,

                       public = list(

                         ##############################################################
                         # Initializer
                         ##############################################################

                         initialize = function(N, locNow_init, genotype_init, MBITES_PAR){

                           private$MBITES_PAR = MBITES_PAR

                           private$pop = MASHcpp::HashMap$new(N = N+500L)
                           for(i in 1:N){
                             ID = paste0("0_",i,"_",genotype_init[i])
                             private$pop$assign(key = ID, value = MosquitoFemale$new(id=ID,time=0,locNow=locNow_init[i],genotype=genotype_init[i],state=private$MBITES_PAR$initState,eggT=MBITES_PAR$eggT,eggP=MBITES_PAR$eggP,energyPreG=MBITES_PAR$energyPreG))
                             private$pop$get(ID)$set_FemalePopPointer(self)
                           }

                         } # end initializer

                       ),

                       private = list(

                         # Fields
                         pop = NULL,               # mosquito population
                         MBITES_PAR = list(),        # MBITES Parameters

                         # Pointers
                         MalePopPointer = NULL,    # Point to MosquitoPopMale in the same microsimulation Tile
                         LandscapePointer = NULL,  # Point to Landscape object in same microsimulation Tile
                         HumansPointer = NULL,     # Point to HumanPop object in same microsimulation Tile
                         TilePointer = NULL        # Point to enclosing microsimulation Tile

                       )
)


###############################################################################
# MosquitoPopMale: Class Definition
###############################################################################

#' MosquitoPopMale Class Definition
#'
#' im a class!
#'
#' @docType class
#' @format An \code{\link{R6Class}} generator object
#' @keywords R6 class
#'
#' @section **Constructor**:
#'  * argument: im an agument!
#'
#' @section **Methods**:
#'  * method: im a method!
#'
#' @section **Fields**:
#'  * field: im a field!
#'
#' @export
MosquitoPopMale <- R6::R6Class(classname = "MosquitoPopMale",
                       portable = TRUE,
                       cloneable = FALSE,
                       lock_class = FALSE,
                       lock_objects = FALSE,

                       public = list(

                         ##############################################################
                         # Initializer
                         ##############################################################

                         initialize = function(N, locNow_init, genotype_init, MBITES_PAR){

                           private$initState = MBITES_PAR$initStateMale
                           private$MBITES_PAR = MBITES_PAR

                           private$pop = MASHcpp::HashMap$new(N = N+500L)
                           for(i in 1:N){
                             ID = paste0("0_",i,"_",genotype_init[i])
                             private$pop$assign(key = ID, value = MosquitoMale$new(id=ID,time=0,locNow=locNow_init[i],genotype=genotype_init[i],state=private$MBITES_PAR$initState,mateFitness=1))
                             private$pop$get(ID)$set_MalePopPointer(self)
                           }

                         } # end initializer

                       ),

                       private = list(

                         # Fields
                         pop = NULL,               # mosquito population
                         MBITES_PAR = list(),        # MBITES Parameters

                         # Pointers
                         FemalePopPointer = NULL,    # Point to MosquitoPopMale in the same microsimulation Tile
                         LandscapePointer = NULL,  # Point to Landscape object in same microsimulation Tile
                         HumansPointer = NULL,     # Point to HumanPop object in same microsimulation Tile
                         TilePointer = NULL        # Point to enclosing microsimulation Tile

                       )
)
