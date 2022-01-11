
#' @title Predict tree volume from tree girth and height
#' @description Predict tree commercial volume (VC22) as a function of tree girth (C130) and height (m) for a given species
#'
#' @param C130 A single value of girth in centimeter with hom = 130 cm
#' @param height A single vale of stree height in meter
#' @param speciesCode An integer defining species (see table eqNumber)
#'
#' @return tree commercial volume (VC22) in cubic meters
#' @export
#'
#' @examples
#' tarif3(90,20,1)
#'
tarif3<-function(C130,height, speciesCode){

  if(is.na(C130) | is.na(height) | is.na(speciesCode)){
    return(NA)
  }else{
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
}
