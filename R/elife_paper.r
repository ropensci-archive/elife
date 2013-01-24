#' Get full text eLife papers via XML. 
#' 
#' @import RCurl XML
#' @param doi DOI to get full text for. 
#' @details Returns raw XML right now.
#' @examples \dontrun{
#' elife_paper(doi="10.7554/eLife.00160")
#' }
#' @export
elife_paper <- function(doi = NULL)
{
	url <- "http://elife.elifesciences.org/elife-source-xml/"
	url2 <- paste0(url, doi)
	tt <- getURL(url2)
	out <- xmlParse(tt)
	abstracts <- getNodeSet(out, "//abstract/p", fun=xmlValue)
	abstract <- paste0(abstracts[-grep("DOI", abstracts)], collapse=" ")
	
# 	getNodeSet(out, "//body/sec")
# 	xpathApply(out, "//sec[sec-type='intro']")
# 	xpathApply(getNodeSet(out, "//body"), "//title='Introduction'")
# 	//x:item[x:title='Nexus file']
}