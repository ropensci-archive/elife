\name{elife_paper}
\alias{elife_paper}
\title{Get full text eLife papers via XML.}
\usage{
elife_paper(doi = NULL, what = "xml")
}
\arguments{
  \item{doi}{DOI to get full text for.}

  \item{what}{Specify what you want returned. One of xml,
  all, abstract, introduction, methods, results,
  discussion, figtabcaps, references.}
}
\description{
Get full text eLife papers via XML.
}
\details{
Returns what you like with the what parameter.
}
\examples{
\dontrun{
elife_paper(doi="10.7554/eLife.00160", 'xml')
elife_paper(doi="10.7554/eLife.00160", 'abstract')
elife_paper(doi="10.7554/eLife.00160", 'exec_summary')
}
}

