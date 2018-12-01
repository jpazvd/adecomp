**********************************************
** 	Example of adecomp for decoomposing changes of 
** 	Poverty, Inequality and the Growth of the bottom 40 
** 
** 	Author: 	Joao Pedro Azevedo
** 	Date: 	30nov2018
**********************************************
***********************************************
***	 Set system
***********************************************
clear
set seed  1000001
set matsize 4000

*cd C:\Users\wb255520\Documents\000.general\02.ado_files\14.adecomp\examples
*cd "C:\Users\wb255520\OneDrive - WBG\000.general\02.ado_files\14.adecomp\examples"
cd "C:\Users\wb255520\Documents\GitHub\adecomp\run"

***********************************************
***	 Pull the data using datalibweb
***********************************************
/* please remove the version control of both master and adaptation if you 
would like to obtain the latest available file */

datalibweb, country (tur) year(2006 2011) type(ecapov) ///
			module(3 7)incppp(gall gallT health rent durables) ppp(2011) ///
			vermast(01)  veralt(02)  append  clear

save adecomp_example_v2.dta, replace

***********************************************
***	Call dataset
***********************************************

use adecomp_example_v2.dta, clear

***********************************************
***	Derive individual variables
***********************************************

gen age2 = age
recode age2 0/5=3 6/14=10 15/19=17 20/24=22 25/29=27 30/34=32 35/39=37 40/44=42 45/49=47 50/54=52 55/59=57 60/64=62 65/99=67
gen adults=age2 >= 15
gen employed=(wage!=. & wage!=0)  & age>=15
replace wage_def=0 if age<15     						/*55 observations*/

***********************************************
***	Collapse information at household level
***********************************************

collapse ///
		(mean) weight icp2005 cpi2005 gall gallT health durables hhsize ///
				gall_2011ppp health_2011ppp durables_2011ppp 			///
		(sum) totinc_def oinc_def wage_def SA_def remit_def pension_def ///
				unemp_def property_def agri_inc_def adults employed  ///
			, by(hhid year)

drop if adults==0

*****************************************************************
/* Generate expenditure aggregate at the household level 		*/
*****************************************************************

egen double gallT2_2011ppp  = ///
		rowtotal(gall_2011ppp health_2011ppp durables_2011ppp)

*****************************************************************
/* Generate population weights at the household level  			*/
*****************************************************************

gen popw=weight*hhsize

drop if popw == .                             /* drop 25 observations */

*****************************************************************
*** Generate income variables (in PPP prices) all values already 
***	in 2005 prices.
*****************************************************************

foreach var of varlist  totinc_def oinc_def wage_def SA_def remit_def ///
						pension_def unemp_def property_def agri_inc_def {
	replace `var'=`var'/icp2005
	replace `var'=`var'/1000000 if year==2002
}

*****************************************************************
*** generate additional variables needed for adecomp
*****************************************************************

gen double adult_sh=adults/hhsize

gen double employed_sh=employed/adults

replace employed_sh=0 if employed==0

gen double wage_def_pe=wage_def/employed

replace wage_def_pe=0 if wage_def==0

gen double totinc_def_pc = totinc_def/hhsize

foreach var of varlist oinc_def SA_def remit_def pension_def  ///
								unemp_def property_def agri_inc_def {
	gen  `var'_pa=`var'/adults
}

egen double total=rsum(oinc_def wage_def SA_def remit_def pension_def  ///
							unemp_def property_def agri_inc_def)

gen double other_def_pa=((totinc_def-total)/adults) + unemp_def_pa + ///
									property_def_pa +  oinc_def_pa

gen double other_def_pa1=((totinc_def-total)/adults) + property_def_pa +  ///
									oinc_def_pa

*****************************************************************
/* Generate poverty lines  */
*****************************************************************

***** 2.50 USD-PPP
gen pline250=2.50*365

***** 5.00 USD-PPP
gen pline500=5*365

***** 10.00 USD-PPP
gen pline10=10*365

*****************************************************************
/* Decomposition            */
*****************************************************************
/** Specification:

Y_pc = Y_t/P = A/P * (L_t + NL_t)/A = A/P*[(O/A*W/O)+NL/A]

where:

Y_pc = Per capita Income
Y_t  = Total household income
P    = Total members of the household
A    = Total number of adults in the household (15+ years of age)
L_t  = Total Labor Income in the household
NL_t = Total Non Labor Income in the household
A/P  = Share of adults in the household (15 + yearss of age)
O/A  = Share of adults with labor income different from zero
W/O  = Average earnings of adults with labor income different from zero
NL/A = Average non labor earnings per adults (15+ years of age)

*********************************************************
*** Income decomposition
*********************************************************
***** 2.50 USD-PPP */

adecomp totinc_def_pc ///
	adult_sh employed_sh wage_def_pe ///
	SA_def_pa pension_def_pa  remit_def_pa  agri_inc_def_pa other_def_pa  ///
		[w=popw] ,by(year) equation(c1*((c2*c3)+c4+c5+c6+c7+c8)) ///
			indicator(fgt0 fgt1 fgt2 gini theil)  varpl(pline250)

***** 5.00 USD-PPP

adecomp totinc_def_pc ///
	adult_sh employed_sh wage_def_pe ///
	SA_def_pa pension_def_pa  remit_def_pa  agri_inc_def_pa other_def_pa  ///
		[w=popw] ,by(year) equation(c1*((c2*c3)+c4+c5+c6+c7+c8)) ///
			indicator(fgt0 fgt1 fgt2 gini theil)  varpl(pline500)

*********************************************************
*** Expenditure
*********************************************************
*** generate propensity to consume (only applies if 
***	expenditure data is collected in the same survey) */
*********************************************************
***** 5.00 USD-PPP

gen cration= gallT2_2011ppp/ totinc_def_pc

adecomp gallT2_2011ppp cration ///
		adult_sh employed_sh wage_def_pe ///
		SA_def_pa   pension_def_pa  remit_def_pa  agri_inc_def_pa other_def_pa ///
			[w=popw] , by(year) ///
				equation(c1*(c2*((c3*c4)+c5+c6+c7+c8+c9))) ///
				indicator(fgt0  gini)  varpl( pline500 )




*********************************************************
/*** generate propensity to consume (only applies if 
	expenditure data is collected in the same survey) 	*/
*********************************************************
***** 5.00 USD-PPP

egen nonlabor_pa = rowtotal( SA_def_pa   pension_def_pa  remit_def_pa  ///
								agri_inc_def_pa other_def_pa )

adecomp gallT2_2011ppp cration ///
		adult_sh employed_sh wage_def_pe ///
		nonlabor_pa ///
			[w=popw] , by(year) ///
				equation(c1*(c2*((c3*c4)+c5))) ///
				indicator(fgt0  gini)  varpl( pline500 )

				
*********************************************************
*** Share Prosperity
*********************************************************

***** 2.50 USD-PPP */

adecomp totinc_def_pc ///
	adult_sh employed_sh wage_def_pe ///
	SA_def_pa pension_def_pa  remit_def_pa  agri_inc_def_pa other_def_pa  ///
		[w=popw] ,by(year) ///
			equation(c1*((c2*c3)+c4+c5+c6+c7+c8)) ///
			indicator(fgt0 fgt1 fgt2 gini theil)  ///
			varpl(pline250) bottom(40) method(growth)
		

***** 2.50 USD-PPP */

adecomp totinc_def_pc ///
		adult_sh employed_sh wage_def_pe ///
		nonlabor_pa ///
		[w=popw] ,by(year) equation(c1*((c2*c3)+c4)) ///
			indicator(fgt0 fgt1 fgt2 gini theil)  ///
			varpl(pline250) bottom(40) method(growth)
		
***** 5.00 USD-PPP
		
adecomp gallT2_2011ppp cration ///
		adult_sh employed_sh wage_def_pe ///
		nonlabor_pa ///
			[w=popw] , by(year) ///
				equation(c1*((c2*((c3*c4)+c5)))) bottom(40) ///
				method(growth) indicator(fgt0)  varpl( pline500 )

				
				