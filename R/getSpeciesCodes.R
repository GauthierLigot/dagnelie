#' @title getSpeciesCodes
#' @description This function return a species table with names and codes.
#'
#' @return species table with names and codes
#' @export
#'
#' @examples
#' getSpeciesCodes()
getSpeciesCodes<-function(){
  out<-data.frame("code"=eqNumber$Code,
                  "name1"=eqNumber$AbgEssence,
                  "name2"=eqNumber$ESS_D)
  return(out)
  }
