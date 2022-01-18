
#' @title getEquationWithParam
#'
#' @param tarif an integer, either 1, 2 or 3, refering to a tarif function(see the readme)
#' @param speciesCode an integer indicating species code
#'
#' @return a character showing the equation and the parameters
#' @export
#'
#' @examples getEquationWithParam(1,2)
#'
getEquationWithParam<-function(tarif, speciesCode){

  if(!tarif %in% 1:3) stop("ERROR : tarif must be 1, 2 or 3")
  if(is.na(speciesCode)) stop("ERROR : species code is NA")

  if(tarif == 1){
    eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
    params<-cubeParams[cubeParams$CUB==1 & cubeParams$NumEquation == eqnum,]

    b0<-params$BV
    b1<-params$CV
    b2<-params$DV
    b3<-params$EV

    equation = paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3")

  }else if (tarif == 2){
    eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
    params<-cubeParams[cubeParams$CUB==2 & cubeParams$NumEquation == eqnum,]

    b0<-params$BV
    b1<-params$CV
    b2<-params$DV
    b3<-params$EV
    b4<-params$FV
    b5<-params$GV

    equation = paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3 + ",b4,"*hdom + ",b5,"*C130^2*hdom")


  }else if(tarif == 3){

    eqnum<-eqNumber[eqNumber$Code==speciesCode,]$NumEquation
    params<-cubeParams[cubeParams$CUB==3 & cubeParams$NumEquation == eqnum,]

    b0<-params$BV
    b1<-params$CV
    b2<-params$DV
    b3<-params$EV
    b4<-params$FV
    b5<-params$GV

    equation = paste0(b0," + ",b1,"*C130 + ",b2,"*C130^2 + ",b3,"*C130^3 + ",b4,"*height + ",b5,"*C130^2*height")

  }

  return(equation)

}
