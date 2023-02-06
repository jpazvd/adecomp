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

adecomp y x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, by(year) eq((c1*c2 + c3*c4+ c5)*c6 + c7*c8+c9*c10+c11*c12) varpl(line) in(fgt0 fgt1 fgt2 gini theil)

