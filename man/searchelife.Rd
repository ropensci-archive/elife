\name{searchelife}
\alias{searchelife}
\title{Make an eLife API call.}
\usage{
  searchelife(terms, term2 = "or", searchin = NULL,
    boolean, give = "doi")
}
\arguments{
  \item{terms}{Search terms.}

  \item{term2}{or, and, etc.}

  \item{searchin}{what area to search in, see examples}

  \item{boolean}{what boolean to use, one of contain,
  matches, ...}

  \item{give}{What to give back as the result. For now just
  doi}
}
\description{
  Make an eLife API call.
}
\examples{
\dontrun{
# Simpler queries
searchelife(terms="Cell biology", searchin="subject_area", boolean="contains")
searchelife(terms="hormone", searchin="article_title", boolean="matches")
searchelife(terms="hormone", searchin="abstract", boolean="matches")
searchelife(terms="hormone", searchin="article_title", boolean="matches")

# more complicated queries
searchelife(terms="hormone", term2="or", searchin=c("article_title","abstract"), boolean="matches")
}
}

