#'required packages
#'@import sangerseqR
#'@import DECIPHER
#'@import Biostrings

#'makestring function
#'
#' For imported sanger files, makestring extracts the sequence + turns into a string.
#' For gRNA sequences imported as vectors, makestring turns the sequence into a gRNA string.
#' @export
makestring <- function(x){
  if(typeof(x) !="character"){
    xseq <- primarySeq(x, string = TRUE)
    xstring = Biostrings::DNAStringSet(xseq)
  } else {
    xstring = Biostrings::DNAStringSet(x)
  }}

#'alignsequences function.
#'
#'Aligns 5 sequences and opens the alignment output in a browser.
#'@export
alignsequences <- function(a,b,c,d,e){
  alignment <- AlignProfiles(a,b)
  alignment <- AlignProfiles(alignment,c)
  alignment <- AlignProfiles(alignment,d)
  alignment <- AlignProfiles(alignment,e)
  BrowseSeqs(alignment)
}
