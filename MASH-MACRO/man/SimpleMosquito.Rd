% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SIMECOL-SimpleMosy-Class.R
\docType{class}
\name{SimpleMosquito}
\alias{SimpleMosquito}
\title{SimpleMosquito Class Definition}
\format{An \code{\link{R6Class}} generator object}
\usage{
SimpleMosquito
}
\description{
Generate a SimpleMosquito object. A SimpleMosquito is a lightweight class for simulating very large populations of mosquitoes and is not intended to be used in M-BITES simulations.
SimpleMosquitoes are advanced through the life course as a generalized semi-Markov chain; if exponential distributions are used for waiting times then it simulates a trajectory of
a continuous-time Markov chain. Here chain is used to specify that the mosquito always has a finite state space. These mosquitoes do not track their history, they are just used to
simulate vessels for pathogen transmission.
}
\section{\strong{Constructor}}{

\itemize{
\item myID: character ID "patchID_myID"
\item myState: character state
\item tStart: time to begin my simulation (given in global time)
}
}

\section{\strong{Methods}}{

\itemize{
\item get_pop: see \code{\link{get_pop_HumanPop}}
\item get_human: see \code{\link{get_human_HumanPop}}
\item get_history: see \code{\link{get_history_HumanPop}}
\item simHumans: see \code{\link{simHumans_HumanPop}}
}
}

\section{\strong{Fields}}{

\itemize{
\item N: number of human
\item tStart: time to start simulation
\item pop: a object of class \code{\link[MASHcpp]{HashMap}} that stores instantiations of \code{\link{Human}}, see help for more details on the internal structure of this type.
}
}

\keyword{R6}
\keyword{class}
