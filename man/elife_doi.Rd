\name{elife_doi}
\alias{elife_doi}
\title{Get metadata on an article using a DOI, one to many.}
\usage{
  elife_doi(dois = NULL)
}
\arguments{
  \item{doi}{A single doi or a vector of quoted DOIs.}
}
\description{
  Get metadata on an article using a DOI, one to many.
}
\examples{
\dontrun{
# one DOI
elife_doi(dois="10.7554/eLife.00160")

# many DOIs
elife_doi(dois=c("10.7554/eLife.00160","10.7554/eLife.00248"))

# Search for articles using **, then use DOIs in elife_doi call
dois <- searchelife("")
elife_doi(dois=dois)
}
}

