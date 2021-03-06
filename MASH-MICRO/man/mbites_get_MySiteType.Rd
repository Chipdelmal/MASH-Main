% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MBITES-Complex-Bouts.R
\name{mbites_get_MySiteType}
\alias{mbites_get_MySiteType}
\title{M-BITES: Return Site Type \code{MosquitoFemale}}
\usage{
mbites_get_MySiteType()
}
\value{
vector of landing spot weights
}
\description{
Method to return integer corresponding to site type of \code{\link{MicroSite}} this mosquito is currently at.
Site Types:
\itemize{
\item 1: peri-domestic site
\item 0: not peri-domestic site
}
}
\details{
\itemize{
\item This method is bound to \code{MosquitoFemale$get_MySiteType()}.
}
}
