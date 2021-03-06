% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MOSQUITO-MosquitoPop-Methods.R
\name{push_pop_MosquitoPopFemale}
\alias{push_pop_MosquitoPopFemale}
\title{Push pop}
\usage{
push_pop_MosquitoPopFemale(N, tEmerge, genotype, locNow)
}
\arguments{
\item{N}{integer; number of emerging mosquitoes}

\item{tEmerge}{integer; day of emergence}

\item{genotype}{integer; genotype of emerging mosquitoes}

\item{locNow}{integer; site of emergence}
}
\description{
Push new female mosquitoes into \code{\link{MosquitoPopFemale}}.
\itemize{
\item This method is bound to \code{MosquitoPopFemale$push_pop}
}
}
