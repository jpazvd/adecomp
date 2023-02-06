
cd "C:\Users\wb255520\GitHub\myados\adecomp\src"

clear all
set maxvar 32766
set obs 1000
gen x1 = invnorm(uniform())
gen x2 = 2*invnorm(uniform())
gen x3 = 0.5*invnorm(uniform())
gen x4 = 3*invnorm(uniform())
gen x5 = 5*invnorm(uniform())
gen x6 = invnorm(uniform())
gen x7 = int(invnorm(uniform()))
gen x8 = invnorm(uniform()) + invnorm(uniform())
gen x9 = invnorm(uniform())/invnorm(uniform())
gen x10 = invnorm(uniform())
gen x11 = invnorm(uniform())
gen x12 = invnorm(uniform())
gen ye = invnorm(uniform())
gen year=.
replace year= 2000 if ye<=0.5
replace year= 2010 if ye>0.5

gen double y = (x1*x2 + x3*x4+ x5)*x6 + x7*x8 + x9*x10 + x11*x12
gen line = 1

which adecomp

adecomp y x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, by(year) eq((c1*c2 + c3*c4+ c5)*c6 + c7*c8+c9*c10+c11*c12) varpl(line) in(fgt0 fgt1 fgt2 gini theil)


adecomp y x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, by(year) eq((c1*c2 + c3*c4+ c5)*c6 + c7*c8+c9*c10+c11*c12) varpl(line) in(fgt0 fgt1 fgt2 gini theil mean median sum)


adecomp y x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, by(year) eq((c1*c2 + c3*c4+ c5)*c6 + c7*c8+c9*c10+c11*c12) in(mean median sum)


/* set time

. which adecomp
C:\Users\wb255520\ado\plus\a\adecomp.ado
*! version 1.6  15Mar2021
*! Joao Pedro Azevedo, Minh Cong Nguyen, Viviane Sanfelice
r; t=0.01 12:58:55


Check the equation:
y = (x1*x2 + x3*x4+ x5)*x6 + x7*x8+x9*x10+x11*x12

Summary for variables: y
Group variable: year 

    year |         N      Mean        SD       Min       Max
---------+--------------------------------------------------
    2000 |       696  .8404011  32.04828 -115.0662  789.5269
    2010 |       304  .2574808  9.623052 -67.30731  60.28847
------------------------------------------------------------

Summary for variables: equation
Group variable: year 

    year |         N      Mean        SD       Min       Max
---------+--------------------------------------------------
    2000 |       696  .8404011  32.04828 -115.0662  789.5269
    2010 |       304  .2574808  9.623052 -67.30731  60.28847
------------------------------------------------------------



Shapley decomposition:
Number of obs      =    1000
Number of paths    =   479001600
Number of factors  =   12
Method             =   difference

Shapley decomposition - Welfare Indicator

----------------------------------------------------------------------------------
                 |                        Welfare Indicator                       
          Effect |      FGT(0)       FGT(1)       FGT(2)         Gini        Theil
-----------------+----------------------------------------------------------------
              x1 |       1.283      -22.918     -936.901       -6.662      -58.073
              x2 |       0.458       -9.394     -460.319        1.510      -27.622
              x3 |       0.533      -10.493     -406.463        2.659       16.268
              x4 |       0.722      -13.154     -462.049        3.184       19.087
              x5 |      -2.935       23.324      945.187       -5.924       19.034
              x6 |      -2.738       72.783    1,956.501        4.538        6.108
              x7 |       1.480      -14.805     -551.540        1.343      -26.317
              x8 |      -0.703      -11.094     -545.625       -0.868       35.091
              x9 |      -2.877      -43.361  -30,452.118        2.073       54.229
             x10 |       1.168       15.370   29,295.358       10.022       18.857
             x11 |       0.520      -17.284     -667.345       -1.972       -6.775
             x12 |       0.067      -12.835     -622.923       -0.157       -6.269
total difference |      -3.021      -43.861   -2,908.237        9.745       43.619
----------------------------------------------------------------------------------
r; t=86.04 12:58:19



** 