\name{elife_doi}
\alias{elife_doi}
\title{Get metadata on an article using a DOI, one to many.}
\usage{
  elife_doi(dois = NULL, ret = "all")
}
\arguments{
  \item{dois}{A single doi or a vector of quoted DOIs.}

  \item{ret}{Return a specific metadata section. One of:
  about, copyright_holder, article_type, pub_date_day,
  correspondence, award_group_funding_source,
  research_organism, license_url, doi_url,
  pub_date_timestamp, ack, components, journal_title,
  keywords, authors, accepted_date_day, accepted_date_date,
  article_institution,
  award_group_principle_award_recipient,
  accepted_date_timestamp, abstract, received_date_month,
  received_date_year, journal_issn_epub, pub_date_year,
  conflict, funding_statement, received_date_date,
  publisher, article_title, refs, license,
  accepted_date_year, doi, license_type,
  accepted_date_month, copyright_year, copyright_statement,
  pub_date_month, article_country, journal_id,
  received_date_day, subject_area, received_date_timestamp,
  pub_date_date}
}
\value{
  Gives back a list of all metadata components unless you
  specify which you want back, see examples below.
}
\description{
  Get metadata on an article using a DOI, one to many.
}
\examples{
\dontrun{
# one DOI, return everything
elife_doi(dois="10.7554/eLife.00160")

# one DOI, return just acknowledgements
elife_doi(dois="10.7554/eLife.00160", ret="ack")

# many DOIs
elife_doi(dois=c("10.7554/eLife.00160","10.7554/eLife.00248"), ret="article_type")

# Search for articles using , then use DOIs in elife_doi call
dois <- searchelife(terms="Cell biology", searchin="subject_area", boolean="contains")
elife_doi(dois=dois, ret="subject_area")
}
}

