% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/competition.R
\name{competition}
\alias{competition}
\title{Build a virtual competition model}
\usage{
competition(coordinates, covariance, precision, decay, autofill = TRUE)
}
\arguments{
\item{coordinates}{two-column matrix-like set of row and column coordinates 
of observational units}

\item{covariance}{matrix-like object}

\item{precision}{matrix-like object}

\item{decay}{numeric. The positive value of the decay parameter \eqn{\alpha}.
Typically 1 or 2. See Details.}

\item{autofill}{logical. If TRUE (default) it will try to fill missing rows
or columns with missing observations. Otherwise, will treat individuals as
neighbours even if they are across an empty line.}
}
\value{
An object inheriting from \code{spatial}.
}
\description{
Given the coordinates of a set of observations, a decay parameter and a 
structure matrix, compute the incidence matrix of competition, and return a 
random effect with the given structure.
}
\details{
The competition model attributes to each individual a random effect of 
competition with variance \eqn{\sigma_{a_c}^2}, which impacts the phenotype 
of the neighbours rather than its own phenotype.

Conversely, the effect of the competition over one's phenotype is given by 
the additive-genetic competition effects of the neighbours, weighted by the 
relative distances. If \eqn{\alpha} is the decay parameter and \eqn{a_c} is 
the random competition effect of a neighbour at distance \eqn{d}, then the
Weighted Neighbour Competition effect over one's phenotype is given by
\deqn{wnc = \sum_{\mathrm{neighbours}} k d^{-\alpha} a_c,}{% wnc =
\sum_{neighbours} k (1/d)^\alpha a_c,} where \eqn{k} is a normalizing
constant which makes \eqn{Var(wnc) = \sigma_{a_c}^2} and independent of the
number of neighbours.
}
