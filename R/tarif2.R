
#' @title Predict tree volume from tree girth and dominant height
#' @description Predict tree commercial volume (VC22) as a function of tree girth (C130) and dominant height (m) for a given species
#'
#' @param C130 A vector of girth in centimeter with hom = 130 cm
#' @param hdom A value of stand dominant height in meter
#' @param speciesCode An integer defining species (see table eqNumber)
#'
#' @return tree commercial volume (VC22) in cubic meters
#' @export
#'
#' @examples
#' tarif2(90,21,1)
#'
tarif2<-function(C130,hdom, speciesCode){

  if(is.na(hdom)) stop("ERROR : missing HDOM")
  if(is.na(speciesCode)) stop("ERROR : missing species code")

  eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
  params<-cubeParams[cubeParams$CUB==2 & cubeParams$NumEquation == eqnum,]

  b0<-params$BV
  b1<-params$CV
  b2<-params$DV
  b3<-params$EV
  b4<-params$FV
  b5<-params$GV

  # print(paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3 + ",b4,"*hdom + ",b5,"*C130^2*hdom"))

  v <- b0 + b1*C130 + b2*C130^2 + b3*C130^3 + b4*hdom + b5*C130^2*hdom
  return(v)
}
