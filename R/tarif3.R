
#' @title Predict tree volume from tree girth and height
#' @description Predict tree commercial volume (VC22) as a function of tree girth (C130) and height (m) for a given species
#'
#' @param C130 A vector of girth in centimeter with hom = 130 cm
#' @param height A vector of tree height in meter. It must be of the same length as C130.
#' @param speciesCode An integer defining species (see table eqNumber)
#'
#' @return tree commercial volume (VC22) in cubic meters
#' @export
#'
#' @examples
#' tarif3(90,20,1)
#'
tarif3<-function(C130,height, speciesCode){

  if(is.na(speciesCode)) stop("ERROR : missing species code")
  if(length(C130) != length(height)) stop("ERROR : C130 and height must be of same length.")

  eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
  params<-cubeParams[cubeParams$CUB==3 & cubeParams$NumEquation == eqnum,]

  b0<-params$BV
  b1<-params$CV
  b2<-params$DV
  b3<-params$EV
  b4<-params$FV
  b5<-params$GV

  # print(paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3 + ",b4,"*height + ",b5,"*C130^2*height"))

  v <- b0 + b1*C130 + b2*C130^2 + b3*C130^3 + b4*height + b5*C130^2*height
  return(v)
}
