library(tidyverse)

cubeParams%>%
  filter(NumEquation == 10 & CUB == 3)

cubeParams2<-cubeParams%>%
  # filter(NumEquation == 10 & CUB == 3)
  mutate(BV = ifelse(NumEquation == 10 & CUB == 3,-0.03508 ,BV),
         CV = ifelse(NumEquation == 10 & CUB == 3,0.001238 ,CV),
         DV = ifelse(NumEquation == 10 & CUB == 3,-0.00000526 ,DV),
         EV = ifelse(NumEquation == 10 & CUB == 3,-0.0000001489 ,EV),
         FV = ifelse(NumEquation == 10 & CUB == 3,-0.000073 ,FV),
         GV = ifelse(NumEquation == 10 & CUB == 3,0.00000394 ,GV),
         HV = ifelse(NumEquation == 10 & CUB == 3,1.013919 ,HV),
         IV = ifelse(NumEquation == 10 & CUB == 3,-0.0744811 ,IV))

cubeParams2%>%
  filter(NumEquation == 10 & CUB == 3)

cubeParams<-cubeParams2

save(cubeParams,eqNumber,file="R/sysdata.rda", version = 2)
