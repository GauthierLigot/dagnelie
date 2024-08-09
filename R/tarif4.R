
#' @title Predict merchandable branch volume from tree girth and height
#' @description Predict tree commercial volume of branches (VC22) as a function of tree girth (C130) and height (m) for a given species
#'
#' @param C130 A vector of girth in centimeter with hom = 130 cm
#'
#' @return tree merchantable branch volume (VC22) in cubic meters
#' @export
#'
#' @examples
#' tarif4(90,1)
#'
tarif4<-function(C130, speciesCode){

  if(is.na(speciesCode)) stop("ERROR : missing species code")

  eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
  params<-cubeParams[cubeParams$CUB==4 & cubeParams$NumEquation == eqnum,]

  b0<-params$BV
  b1<-params$CV
  b2<-params$DV
  b3<-params$EV


  v <- b0 + b1*C130 + b2*C130^2 + b3*C130^3
  return(v)
}
