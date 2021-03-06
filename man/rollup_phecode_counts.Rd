% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rollup_phecode_counts.R
\name{rollup_phecode_counts}
\alias{rollup_phecode_counts}
\title{Rollup phecode counts}
\usage{
rollup_phecode_counts(
  patient_code_counts,
  patient_col = patient,
  phecode_col = phecode,
  count_col = counts
)
}
\arguments{
\item{patient_code_counts}{Data containing patient ids, phecodes, and counts
of those phecodes.}

\item{patient_col}{Unquoted name of the column containing patient ids in
passed \code{patient_code_counts}'s dataframe.}

\item{phecode_col}{Unquoted name of the column containing phecodes in passed
dataframe.}

\item{count_col}{Unquoted name of the column containing counts of phecodes in
passed dataframe.}
}
\value{
Dataframe in same format as passed \code{patient_code_counts} with code
counts rolled up. This will most likely be longer than the original dataset
because of the addition of potentially previously ommitted codes.
}
\description{
Takes phecodes that have been coded without rollup - E.g. existance of code
008.10 does not imply the existance of 008.00 - and produces a rolledup
version of the dataset. Works with plain patient-phecode pairs and also with
patient-code-count triplets.
}
\examples{

library(dplyr)

patient_data <- tribble(
  ~patient,    ~code, ~counts,
  1, "250.23",      7,
  1, "250.25",      4,
  1, "696.42",      1,
  1, "555.21",      4,
  2, "401.22",      6,
  2, "204.21",      5,
  2, "735.22",      4,
  2, "751.11",      2,
)

# Rolls up counts for codes if they are present
patient_data \%>\%
  rollup_phecode_counts(patient_col = patient,
                  phecode_col = code,
                  count_col = counts)


}
