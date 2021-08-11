#'required packages
#'@import sangerseqR
#'@import DECIPHER

#'makestring function
#'
#' For imported sanger files, makestring extracts the sequence + turns into a string.
#' For gRNA sequences imported as vectors, makestring turns the sequence into a gRNA string.
#' @export
makestring <- function(x){
  if(typeof(x) !="character"){
    xseq <- sangerseqR::primarySeq(x, string = TRUE)
    xstring = sangerseqR::DNAStringSet(xseq)
  } else {
    xstring = sangerseqR::DNAStringSet(x)
  }}

#'alignsequences function.
#'
#'Aligns 5 sequences and opens the alignment output in a browser.
#'@export
alignsequences <- function(a,b,c,d,e){
  alignment <- DECIPHER::AlignProfiles(a,b)
  alignment <- DECIPHER::AlignProfiles(alignment,c)
  alignment <- DECIPHER::AlignProfiles(alignment,d)
  alignment <- DECIPHER::AlignProfiles(alignment,e)
  DECIPHER::BrowseSeqs(alignment)
}
