% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proportional_hazards-survival.R
\name{survival_prob_coxph}
\alias{survival_prob_coxph}
\title{A wrapper for survival probabilities with coxph models}
\usage{
survival_prob_coxph(
  x,
  new_data,
  time,
  output = "surv",
  interval = "none",
  conf.int = 0.95,
  ...
)
}
\arguments{
\item{x}{A model from \code{coxph()}.}

\item{new_data}{Data for prediction}

\item{time}{A vector of integers for prediction times.}

\item{output}{One of \code{"surv"}, \code{"conf"}, or \code{"haz"}.}

\item{interval}{Add confidence interval for survival probability? Options
are \code{"none"} or \code{"confidence"}.}

\item{conf.int}{The confidence level.}

\item{...}{Options to pass to \code{\link[survival:survfit]{survival::survfit()}}}
}
\value{
A tibble with a list column of nested tibbles.
}
\description{
A wrapper for survival probabilities with coxph models
}
\examples{
cox_mod <- coxph(Surv(time, status) ~ ., data = lung)
survival_prob_coxph(cox_mod, new_data = lung[1:3, ], time = 300)
}
\keyword{internal}
