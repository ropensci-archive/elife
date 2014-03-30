# `elife`

### Info

This set of functions/package will access full text articles and altmetrics from eLife using their API. 

eLife API documentation [here](http://dev.elifesciences.org/)

elife is part of the [rOpenSci Project](http://ropensci.github.com)

### Quick start


#### Installation

elife is not on CRAN yet. Install using `install_github` with the devtools package

```R
install.packages("devtools")
require(devtools)
install_github("elife", "rOpenSci")
require(elife)
```

#### Simple queries to get DOIs

```coffee
searchelife(terms="Cell biology", searchin="subject_area", boolean="contains")

 [1] "10.7554/eLife.00948" "10.7554/eLife.00663" "10.7554/eLife.00444" "10.7554/eLife.00242"
 [5] "10.7554/eLife.00306" "10.7554/eLife.00745" "10.7554/eLife.00704" "10.7554/eLife.00308"
 [9] "10.7554/eLife.00515" "10.7554/eLife.00572" "10.7554/eLife.00048" "10.7554/eLife.00102"
[13] "10.7554/eLife.00658" "10.7554/eLife.00386" "10.7554/eLife.00243" "10.7554/eLife.00205"
[17] "10.7554/eLife.00800" "10.7554/eLife.00744" "10.7554/eLife.00498" "10.7554/eLife.00415"
[21] "10.7554/eLife.00078" "10.7554/eLife.00804" "10.7554/eLife.00459" "10.7554/eLife.00903"
[25] "10.7554/eLife.00729" "10.7554/eLife.00290" "10.7554/eLife.00291" "10.7554/eLife.00571"
[29] "10.7554/eLife.00170" "10.7554/eLife.00117" "10.7554/eLife.00160" "10.7554/eLife.00422"
[33] "10.7554/eLife.00190" "10.7554/eLife.00558" "10.7554/eLife.00358" "10.7554/eLife.00324"
[37] "10.7554/eLife.00013" "10.7554/eLife.00895"
```

```coffee
searchelife(terms="hormone", searchin="article_title", boolean="matches")

[1] "10.7554/eLife.00675" "10.7554/eLife.00065" "10.7554/eLife.00286"
```

```coffee
searchelife(terms="hormone", searchin="abstract", boolean="matches")

[1] "10.7554/eLife.00958" "10.7554/eLife.00362" "10.7554/eLife.00065" "10.7554/eLife.00675"
[5] "10.7554/eLife.00286" "10.7554/eLife.00415"
```

```coffee
searchelife(terms="hormone", searchin="article_title", boolean="matches")

[1] "10.7554/eLife.00675" "10.7554/eLife.00065" "10.7554/eLife.00286"
```

#### More complicated queries, also to get DOIs

```coffee
searchelife(terms="hormone", term2="or", searchin=c("article_title","abstract"), boolean="matches")

[1] "10.7554/eLife.00958" "10.7554/eLife.00362" "10.7554/eLife.00065" "10.7554/eLife.00675"
[5] "10.7554/eLife.00286" "10.7554/eLife.00415"
```

#### Get article metadata

##### one DOI, return everything

```coffee
elife_doi(dois="10.7554/eLife.00160")

$`04da1702-87d6-41da-9067-39a055b529c8`
$`04da1702-87d6-41da-9067-39a055b529c8`$about
[1] "http://dx.doi.org/10.7554/eLife.00160"

$`04da1702-87d6-41da-9067-39a055b529c8`$copyright_holder
[1] "Guo et al"

$`04da1702-87d6-41da-9067-39a055b529c8`$article_type
[1] "research-article"
...etc...
```

##### one DOI, return just acknowledgements

```coffee
> elife_doi(dois="10.7554/eLife.00160", ret="ack")

$`04da1702-87d6-41da-9067-39a055b529c8`
[1] "AcknowledgementsThe authors thank Dr Vivek Malhotra (CRG, Spain) for kindly providing the constructs of GST-PKD2-KD and GST-PKD3-KD; Dr Juan S. Bonifacino (NIH) for kindly providing the constructs for Yeast-two-hybrid analysis; Dr Stuart Kornfeld (Washington University in St. Louis) for kindly providing regents for purify the AP-1 complex; Ann Fischer and Michelle Richner for tissue culture support; Devon Jensen for providing various constructs of PCP signaling receptors; Kanika Pahuja and Pengcheng Zhang for comments on the manuscript. Y.G is an Associate of the HHMI, G.Z. is an HFSP fellow and R.S. is an Investigator of the HHMI and a Senior Fellow of the Miller Institute, University of California, Berkeley."
```

##### many DOIs, just article type

```coffee
elife_doi(dois=c("10.7554/eLife.00160","10.7554/eLife.00248"), ret="article_type")

$`3eeb9fd7-6efa-490c-b1c9-1153f64514de`
[1] "research-article"

$`04da1702-87d6-41da-9067-39a055b529c8`
[1] "research-article"
```

#### Get full text of articles

The raw XML

```coffee
elife_paper(doi="10.7554/eLife.00160", 'xml')
```

```coffee
<?xml version="1.0"?>
<article xmlns:hw="org.highwire.hpp" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table" xmlns:ref="http://schema.highwire.org/Reference" xmlns:hwp="http://schema.highwire.org/Journal" xmlns:l="http://schema.highwire.org/Linking" xmlns:r="http://schema.highwire.org/Revision" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://www.w3.org/2005/Atom" xmlns:x="http://www.w3.org/1999/xhtml" xmlns:app="http://www.w3.org/2007/app" xmlns:nlm="http://schema.highwire.org/NLM/Journal" xmlns:c="http://schema.highwire.org/Compound" xmlns:hpp="http://schema.highwire.org/Publishing" article-type="research-article" xml:lang="en">
  <front>
    <journal-meta>
```

Just the abstract

```coffee
elife_paper(doi="10.7554/eLife.00160", 'abstract')
```

```coffee
$doi
[1] "http://dx.doi.org/10.7554/eLife.00160.001"

$text
$text[[1]]
[1] "Planar cell polarity (PCP) requires the asymmetric sorting of distinct signaling receptors to distal and proximal surfaces of polarized epithelial cells. We have examined the transport of one PCP signaling protein, Vangl2, from the trans Golgi network (TGN) in mammalian cells. Using siRNA knockdown experiments, we find that the GTP-binding protein, Arfrp1, and the clathrin adaptor complex 1 (AP-1) are required for Vangl2 transport from the TGN. In contrast, TGN export of Frizzled 6, which localizes to the opposing epithelial surface from Vangl2, does not depend on Arfrp1 or AP-1. Mutagenesis studies identified a YYXXF sorting signal in the C-terminal cytosolic domain of Vangl2 that is required for Vangl2 traffic and interaction with the Î¼ subunit of AP-1. We propose that Arfrp1 exposes a binding site on AP-1 that recognizes the Vangl2 sorting motif for capture into a transport vesicle destined for the proximal surface of a polarized epithelial cell."
```