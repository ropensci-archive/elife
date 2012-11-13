#' Make an eLife API call.
#' 
#' @import RCurl XML RJSONIO plyr
#' @param 
#' @examples \dontrun{
#' 
#' }
#' @export
elife <- function(x, url = "https://fluiddb.fluidinfo.com/objects")
{
	args <- compact(list(query = query))
	getForm(url, .params=args)
	
}
fromJSON(getURL("https://fluiddb.fluidinfo.com/valuez?query=has%20elifesciences.org/api_v1/article/accepted_date_month"))
fromJSON(getURL("https://fluiddb.fluidinfo.com/objects?query=elifesciences.org%2Fapi_v1%2Farticle%2Fsubject_area+contains+%22Cell+biology%22&tag=elifesciences.org%2Fapi_v1%2Farticle%2Fdoi"))
fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/article/doi="10.7554/eLife.00013"&tag=*'))
fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/component/article_doi="10.7554/eLife.00013"&tag=*'))
fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/component/type="fig"&tag=elifesciences.org/api_v1/component/doi_url'))
fromJSON(getURL('https://fluiddb.fluidinfo.com/values?query=elifesciences.org/api_v1/article/author=""&tag=*'))