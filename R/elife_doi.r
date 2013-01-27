#' Get metadata on an article using a DOI, one to many.
#' 
#' @import RCurl RJSONIO plyr stringr
#' @param dois A single doi or a vector of quoted DOIs.
#' @param ret Return a specific metadata section. One of: 
#' 		about, copyright_holder, article_type, pub_date_day, correspondence, 
#' 		award_group_funding_source, research_organism, license_url, doi_url, 
#' 		pub_date_timestamp, ack, components, journal_title, keywords, authors, 
#' 		accepted_date_day, accepted_date_date, article_institution, 
#' 		award_group_principle_award_recipient, accepted_date_timestamp, abstract, 
#' 		received_date_month, received_date_year, journal_issn_epub, pub_date_year, 
#' 		conflict, funding_statement, received_date_date, publisher, article_title, 
#' 		refs, license, accepted_date_year, doi, license_type, accepted_date_month, 
#' 		copyright_year, copyright_statement, pub_date_month, article_country, 
#' 		journal_id, received_date_day, subject_area, received_date_timestamp, 
#' 		pub_date_date
#' @return Gives back a list of all metadata components unless you specify which
#' 		you want back, see examples below.
#' @examples \dontrun{
#' # one DOI, return everything
#' elife_doi(dois="10.7554/eLife.00160")
#' 
#' # one DOI, return just acknowledgements
#' elife_doi(dois="10.7554/eLife.00160", ret="ack")
#' 
#' # many DOIs
#' elife_doi(dois=c("10.7554/eLife.00160","10.7554/eLife.00248"))
#' 
#' # Search for articles using , then use DOIs in elife_doi call
#' dois <- searchelife(terms="Cell biology", searchin="subject_area", boolean="contains")
#' elife_doi(dois=dois, ret="subject_area")
#' }
#' @export
elife_doi <- function(dois = NULL, ret = "all")
{
	url <- "https://fluiddb.fluidinfo.com/values"
	query <- llply(dois, function(x) paste0("elifesciences.org/api_v1/article/doi=", '"', x, '"'))
	query <- paste(query, sep="", collapse=paste0(" ", "or", " "))
	args <- compact(list(query = query, tag = "*"))
	tt <- getForm(url, .params=args)
	temp <- fromJSON(tt)$result$id
	
	foo <- function(x){
		names_ <- sapply(names(llply(x, function(x) names(x))), function(x) str_split(x, "/")[[1]], USE.NAMES=F)
		names_ <- sapply(names_, function(x) x[length(x)])
		out2 <- llply(x, function(x) x[["value"]])
		names(out2) <- names_
		if(ret=="all"){out2} else
			{ out2[[ret]] }
	}
	foosafe <- plyr::failwith(NULL, foo)
	llply(temp, foosafe, .inform=TRUE)
}