#' Get metadata on an article using a DOI, one to many.
#' 
#' @import RCurl XML RJSONIO plyr
#' @param doi A single doi or a vector of quoted DOIs.
#' @examples \dontrun{
#' # one DOI
#' elife_doi(dois="10.7554/eLife.00160")
#' 
#' # many DOIs
#' elife_doi(dois=c("10.7554/eLife.00160","10.7554/eLife.00248"))
#' 
#' # Search for articles using **, then use DOIs in elife_doi call
#' dois <- searchelife("")
#' elife_doi(dois=dois)
#' }
#' @export
elife_doi <- function(dois = NULL)
{
	url <- "https://fluiddb.fluidinfo.com/values"
	
	foo <- function(doi){
		query <- paste0("elifesciences.org/api_v1/article/doi=", '"', doi, '"')
		args <- compact(list(query = query, tag = "*"))
		tt <- getForm(url, .params=args)
		fromJSON(tt)
	}
	llply(dois, foo)
}