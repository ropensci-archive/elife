#' Make an eLife API call.
#' 
#' @import RCurl XML RJSONIO plyr
#' @param terms Search terms. 
#' @param term2 or, and, etc.
#' @param searchin what area to search in, see examples
#' @param boolean what boolean to use, one of contain, matches, ...
#' @param give What to give back as the result. For now just doi
#' @examples \dontrun{
#' # Simpler queries
#' searchelife(terms="Cell biology", searchin="subject_area", boolean="contains")
#' searchelife(terms="hormone", searchin="article_title", boolean="matches")
#' searchelife(terms="hormone", searchin="abstract", boolean="matches")
#' searchelife(terms="hormone", searchin="article_title", boolean="matches")
#' 
#' # more complicated queries
#' searchelife(terms="hormone", term2="or", searchin=c("article_title","abstract"), boolean="matches")
#' }
#' @export
searchelife <- function(terms, term2 = "or", searchin = NULL, boolean, give = "doi")
{
	url <- "https://fluiddb.fluidinfo.com/values"
	
	if(length(searchin)==1){
		query <- paste0("elifesciences.org/api_v1/article/", searchin, "+", boolean, "+", '"', gsub("\\s", "+", terms), '"')
		if(give=="doi"){tag <- "elifesciences.org/api_v1/article/doi"} else{NULL}
		fullurl <- paste0(url, "?query=", query, "&tag=", tag)
		out <- fromJSON(getURL(fullurl))
		laply(out$results$id, function(x) x[[1]][["value"]])		
	} else
	{
		getquery <- function(x) paste0("elifesciences.org/api_v1/article/", x, "+", boolean, "+", '"', gsub("\\s", "+", terms), '"')
		query <- paste(laply(searchin, getquery), sep="", collapse=paste0("+", term2, "+"))
		if(give=="doi"){tag <- "elifesciences.org/api_v1/article/doi"} else{NULL}
		fullurl <- paste0(url, "?query=", query, "&tag=", tag)
		out <- fromJSON(getURL(fullurl))
		laply(out$results$id, function(x) x[[1]][["value"]])		
	}
}
# fromJSON(getURL("https://fluiddb.fluidinfo.com/values?query=has%20elifesciences.org/api_v1/article/accepted_date_month"))
# fromJSON(getURL(
# 	'https://fluiddb.fluidinfo.com/objects?query=elifesciences.org/api_v1/article/subject_area+contains+"Cell+biology"&tag=elifesciences.org/api_v1/article/doi'
# 	))
# fromJSON(
# 	getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/article/doi="10.7554/eLife.00013"&tag=*')
# 	)
# fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/component/article_doi="10.7554/eLife.00013"&tag=*'))
# fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/component/type="fig"&tag=elifesciences.org/api_v1/component/doi_url'))
# fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/article/author=""&tag=*'))