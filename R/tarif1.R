
#' @title Predict tree volume from tree girth
#' @description Predict tree commercial volume (VC22) as a function of tree girth (C130) for a given species
#'
#' @param C130 A vector of girth in centimeter with hom = 130 cm
#' @param speciesCode An integer defining species (see table eqNumber)
#'
#' @return tree commercial volume (VC22) in cubic meters
#' @export
#'
#' @examples
#' tarif1(90,1)
#' tarif1(c(45,60,70,80),2)
#'
tarif1<-function(C130,speciesCode){

  if(is.na(speciesCode)) stop("ERROR : missing species code")

  eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
  params<-cubeParams[cubeParams$CUB==1 & cubeParams$NumEquation == eqnum,]

  b0<-params$BV
  b1<-params$CV
  b2<-params$DV
  b3<-params$EV

  # print(paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3"))

  v <- b0 + b1*C130 + b2*C130^2 + b3*C130^3
  return(v)
}
