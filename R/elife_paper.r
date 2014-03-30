#' Get full text eLife papers via XML. 
#' 
#' @import httr XML
#' @export
#' @param doi DOI to get full text for. 
#' @param what Specify what you want returned. One of xml, all, abstract, introduction,
#'    methods, results, discussion, figtabcaps, references.
#' @details Returns what you like with the what parameter.
#' @examples \dontrun{
#' elife_paper(doi="10.7554/eLife.00160", 'xml')
#' elife_paper(doi="10.7554/eLife.00160", 'abstract')
#' elife_paper(doi="10.7554/eLife.00160", 'exec_summary')
#' }

elife_paper <- function(doi = NULL, what='xml')
{
	url <- sprintf("http://elife.elifesciences.org/elife-source-xml/%s", doi)
	tt <- content(GET(url), as="text")
	out <- xmlParse(tt)
  
  what <- match.arg(what, c('xml','all','abstract','exec_summary','introduction','methods','results','discussion'))
  
  if(what=='xml') { 
    out 
  } else if(what=='all') { 
    message("to be fixed")
#     tmp <- xpathApply(out, "//p", fun=xmlValue)
#     tmp[!vapply(tmp, function(z) grepl("DOI", z), TRUE)]
  } else if(what=='abstract'){  
    abstract <- xpathApply(out, "//abstract[@hwp:id='abstract-1']/p", fun=xmlValue)
    extract_section(abstract)
  } else if(what=='exec_summary'){
    exec_summary <- xpathApply(out, "//abstract[@hwp:id='abstract-2']/p", fun=xmlValue)
    extract_section(exec_summary)
  } else if(what=='introduction'){
    intro <- xpathApply(out, "//body/sec[@sec-type='intro']/p", fun=xmlValue)
    extract_section(intro)
  } else if(what=='results'){
    ## FIX ME
    message("to be fixed")
    # 	xpathApply(out, "//body/sec[@sec-type='results']//p", fun=xmlValue)
#     resultsnodes_title <- getNodeSet(out, "//body/sec[@sec-type='results']/sec/title")
#     resultsnodes_p <- getNodeSet(out, "//body/sec[@sec-type='results']/sec/p")
#     res_titles <- sapply(resultsnodes_title, xmlValue)
#     res_p <- sapply(resultsnodes_p, xmlValue)
#     names(res_p) <- res_titles
  } else if(what=='methods'){
    ## FIX ME
    message("to be fixed")
#     disc <- 
#       xpathApply(out, "//body/sec[@sec-type='methods']//p", fun=xmlValue)
#     res <- list()
#     res$doi <- disc[grepl("DOI", disc)][[1]]
#     res$text <- disc[!grepl("DOI", disc)]
#     res
  } else if(what=='discussion'){
    disc <- xpathApply(out, "//body/sec[@sec-type='discussion']//p", fun=xmlValue)
    extract_section(disc)
  } 
}

extract_section <- function(x){
  res <- list()
  res$doi <- gsub("DOI:", "", x[grepl("DOI", x)][[1]])
  res$text <- x[!grepl("DOI", x)]
  res
}