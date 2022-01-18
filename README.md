
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dagnelie

<!-- badges: start -->
<!-- badges: end -->

The goal of dagnelie is to provide a set of functions to use the
allometric equations fitted by Dagnelie et al. 

Warning : This package is still under development.

Dagnelie et al proposed three form of tarif function, i.e. to predict
the commercial volume of a tree :

The first equation predict the commercial volume (in cubic meter) in
response to tree girth measured at 1,3 meter (C130 in centimeter). The
prediction of this equation can be obtained with .

*v* = *b*0 + *b*1 \* *C*130 + *b*2 \* *C*130<sup>2</sup> + *b*3 \* *C*130<sup>3</sup>

The second equation predict the commercial volume (in cubic meter) in
response to tree girth measured at 1,3 meter (C130 in centimeter) and
stand dominant height (hdom in meter). The prediction of this equation
can be obtained with .

*v* = *b*0 + *b*1 \* *C*130 + *b*2 \* *C*130<sup>2</sup> + *b*3 \* *C*130<sup>3</sup> + *b*4 \* *h**d**o**m* + *b*5 \* *C*130<sup>2</sup> \* *h**d**o**m*

The third equation predict the commercial volume (in cubic meter) in
response to tree girth measured at 1,3 meter (C130 in centimeter) and
tree height (height in meter). The prediction of this equation can be
obtained with .

*v* = *b*0 + *b*1 \* *C*130 + *b*2 \* *C*130<sup>2</sup> + *b*3 \* *C*130<sup>3</sup> + *b*4 \* *h**e**i**g**h**t* + *b*5 \* *C*130<sup>2</sup> \* *h**e**i**g**h**t*

Dagnelie et al. also proposed equation to convert girth measured at 1,5
m (Belgian style, C150) into C130. The prediction of this equation can
be obtained with .

*C*130 = *b*6 \* *C*150 + *b*7

The parameters of these equations depends on the species and species
codes have been set to use the equations in this package. You can get a
table with species names and codes with .

Equation with parameters can been obtained with

## Installation

After downloading the last development version of the package (Build
Source Package available on request), you can install it like so (let us
suppose you stored in a “tmp” directory):

``` r
install.packages("c:/tmp/dagnelie_0.1.0.tar.gz", source = TRUE, repos=NULL)
```

If you have access to the github, you can use the install\_github from
the devtools package:

``` r
devtools::install_github("gauthierLigot/dagnelie")
```

## Example

The volume of a list of trees can be estimated as follows

``` r
library(dagnelie)

#get species codes
getSpeciesCodes()
#>    code name1                      name2
#> 1     1 CH-IN           Chênes indigènes
#> 2     2 CH-RO                Chêne rouge
#> 3     3 HETRE                      Hêtre
#> 4     4 ER-SY            Erable sycomore
#> 5     5 FRENE                      Frêne
#> 6     6 ORMES                      Ormes
#> 7     7 MERIS                   Merisier
#> 8     8 AUBEP                  Aubépines
#> 9     9 PRUNE                 Prunellier
#> 10   10 FE-DI            Feuillus divers
#> 11   11 BOULE                    Bouleau
#> 12   12 AU-BL                Aulne blanc
#> 13   13 AU-GL            Aulne glutineux
#> 14   14 CHARM                     Charme
#> 15   15 CHATA                Châtaignier
#> 16   16 ER-PL               Erable plane
#> 17   17 ER-CH           Erable champêtre
#> 18   18 SORBI                    Sorbier
#> 19   19 MARRO                 Marronnier
#> 20   20 NOISE                  Noisetier
#> 21   21 NOYER                     Noyers
#> 22   24 PE-NO           Peuplier hybride
#> 23   25 PE-TR           Peuplier tremble
#> 24   26 ROBIN                   Robinier
#> 25   27 SA-MA             Saule marsault
#> 26   28 AUT-S              Autres saules
#> 27   29 TILLE                   Tilleuls
#> 28   30 POMMI                    Pommier
#> 29   31 POIRI                    Poirier
#> 30   32 ALISI                   Alisiers
#> 31   33 SUREA                    Sureaux
#> 32   34 BOURD                  Bourdaine
#> 33   35 CERIS                  Cerisiers
#> 34   41 EP-CO              Epicéa commun
#> 35   42 SITKA            Epicéa de Sitka
#> 36   43 DOUGL           Sapin de Douglas
#> 37   44 MELEZ                     Mélèze
#> 38   45 PI-SY              Pin sylvestre
#> 39   46 P-N-A          Pin noir Autriche
#> 40   47 P-N-C          Pin noir de Corse
#> 41   48 PI-WE               Pin weymouth
#> 42   49 PECTI              Sapin pectiné
#> 43   50 GRAND         Sapin de Vancouver
#> 44   51 AUT-S              Autres sapins
#> 45   52 CYPRE                     Cyprès
#> 46   53 TSUGA                      Tsuga
#> 47   54 THUYA                      Thuya
#> 48   55 AUT-R            Autres résineux
#> 49   56    IF                         If
#> 50  110     F  Toutes essences feuillues
#> 51  120     R Toutes essences résineuses
#> 52  150  FENO            Feuillus nobles
#> 53  210    AF            Autres feuillus
#> 54  220    AR            Autres résineux

# generate random data
trees<-data.frame(id = 1:10, species = rep(2,10), girth = 50:59)

# first equation applied on trees
tarif1(trees$girth,speciesCode = 2)
#>  [1] 0.1433435 0.1509199 0.1586845 0.1666372 0.1747774 0.1831050 0.1916197
#>  [8] 0.2003211 0.2092090 0.2182830
# second equation applied on trees
tarif2(trees$girth,hdom = 15,speciesCode = 2)
#>  [1] 0.1227565 0.1279527 0.1332347 0.1386023 0.1440552 0.1495934 0.1552165
#>  [8] 0.1609245 0.1667172 0.1725943
# third equation for one tree
tarif3(C130 = 50,height = 20,speciesCode = 2)
#> [1] 0.1814716
```
