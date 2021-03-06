% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppR6.R
\name{humanPfMOI}
\alias{humanPfMOI}
\title{PfMOI Human Stage Pathogen Class}
\usage{
humanPfMOI(PfID_init, tInf_init = -1, MOI_init = 0, b_init = 0.55,
  c_init = 0.15, chemoprophylaxis_init = FALSE, N = 20)
}
\arguments{
\item{PfID_init}{PfID derived from the tile level PfPedigree}

\item{tInf_init}{initial time of current infection (successful mosquito to human transmission event)}

\item{MOI_init}{initial multiplicity of infection}

\item{chemoprophylaxis_init}{chemoprophylaxis protection status}

\item{damID_init}{initial female gametocyte 'mother'}

\item{sireID_init}{initial male gametocyte 'father'}
}
\description{
A class for storing parameters and state variables of human-stage PfMOI infections.
}
\section{Methods}{

\itemize{
\item get_PfID:
\item push_PfID:
\item get_tInf:
\item push_tInf:
\item get_MOI:
\item set_MOI:
\item get_b:
\item set_b:
\item get_c:
\item set_c:
\item get_damID:
\item push_damID:
\item get_sireID:
\item push_sireID:
\item get_chemoprophylaxis:
\item set_chemoprophylaxis:
}
}

\section{Fields}{

\itemize{
\item a field: talk about me
}
}

