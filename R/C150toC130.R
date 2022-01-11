#' @title C150toC130
#' @description Girth can be measured at different height of measurement (hom). This function
#' converts girth measured with hom = 150 cm into girth with hom = 130 cm
#'
#' @param C150 the girth in cm measured at 150 cm (Belgian style)
#' @param speciesCode an integer defining species (see table eqNumber)
#'
#' @return the estimated girth in cm at 130 cm (international style)
#' @export
#'
#' @examples
#' C150toC130(C150 = 90, speciesCode = 1)
C150toC130<-function(C150,speciesCode){
  eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
  params<-cubeParams[cubeParams$CUB==3 & cubeParams$NumEquation == eqnum,]
  C130<-params$HV*C150 + params$IV
  return(C130)
}
