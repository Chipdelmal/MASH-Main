###############################################################################
#       __  ______   _____ __  __      __________  ____
#      /  |/  /   | / ___// / / /     / ____/ __ \/ __ \
#     / /|_/ / /| | \__ \/ /_/ /_____/ /   / /_/ / /_/ /
#    / /  / / ___ |___/ / __  /_____/ /___/ ____/ ____/
#   /_/  /_/_/  |_/____/_/ /_/      \____/_/   /_/
#
#   MASH-CPP
#   Testing Ground
#   August 31, 2017
#
###############################################################################

rm(list=ls());gc()
library(R6)
library(MASHcpp)

TestClass = R6Class("TestClass",

  portable = TRUE,
  cloneable = TRUE,
  lock_class = FALSE,
  lock_objects = FALSE,

  #public members
  public = list(

    #################################################
    # Constructor
    #################################################

    initialize = function(myID, myState, tStart, popPointer){

      private$myID = myID
      private$state = myState
      private$tNow = tStart
      private$tNext = NULL
      private$popPointer = popPointer

    },

    #################################################
    # Methods
    #################################################

    get_alive = function(){
      return(private$ALIVE)
    },
    set_alive = function(ALIVE){
      private$ALIVE = ALIVE
    },

    get_ID = function(){
      return(private$myID)
    },

    get_state = function(){
      return(private$state)
    },
    set_state = function(state){
      private$state = state
    },

    get_tNow = function(){
      return(private$tNow)
    },
    set_tNow = function(tNow){
      private$tNow = tNow
    },

    get_hist = function(){
      return(private$history)
    },

    simulate = function(){
      private$ALIVE = TRUE
      private$tNow = 0
      while(private$ALIVE){

        # about 1.5 days on average
        tau = rgamma(n=1,shape=5,rate=(1/1.5)*5)

        private$tNow = private$tNow + tau

        private$history = c(private$history,private$tNow)

        # not correctly scaled but good enough
        if(runif(1)<0.15){
          private$ALIVE = FALSE
        }

        # terrible statistical properties
        if(private$tNow > 50){
          private$ALIVE = FALSE
        }

      }

    },

    REMOVE_MYSELF = function(){
      private$popPointer$rm(key=as.character(private$myID))
    }


  ),

  #private members
  private = list(

    # basic fields
    myID = NULL,
    myState = NULL,
    tNow = NULL,
    tNext = NULL,


    history = 0,
    ALIVE = NULL,

    popPointer = NULL

  )

)

TestClass$set(which = "public",name = "finalize",
  value = function(){message(paste0("TestClass" ,private$myID," being garbage collected"))},
  overwrite = TRUE
)


# make a hash table and put 200 of our test class in them
myPop = MASHcpp::HashMap$new(N=10)

for(i in 1:10){
  myPop$assign(key = as.character(i),value = TestClass$new(i,"rest",0,myPop))
}

myPop$rm(key = "5")

myPop$get(key = "1")$REMOVE_MYSELF()

# make sure they are there
myPop$ls()
myPop$get(key = "10")

# cool, now lets simulate each of them.
myPop$apply(tag = "simulate",returnVal = FALSE)
# make sure that they ran and that they all died.
myPop$apply(tag = "get_hist",returnVal = TRUE)

rm(myPop);gc()

# now benchmark just making some mosquitoes and running a sim
library(microbenchmark)
microbenchmark::microbenchmark(
  {
    hashTablePop = MASHcpp::HashMap$new(N=200)
    for(i in 1:200){
      hashTablePop$assign(key = as.character(i),value = TestClass$new(i,"rest",0))
    }
    hashTablePop$apply(tag = "simulate",returnVal = FALSE)
    hashTablePop$apply(tag = "get_hist",returnVal = FALSE)
  },
  times = 100
)

rm(c("hashTablePop"));gc()

# # now benchmark adding and removing elements from the data structure
# microbenchmark::microbenchmark(
#   {
#     hashTablePop = MASHcpp::HashMap$new(N=200)
#
#     # hashTablePop$assign(key = )
#   }
#
# )
