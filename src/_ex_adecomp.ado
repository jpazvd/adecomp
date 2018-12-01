cap program drop _ex_adecomp
program define _ex_adecomp, rclass

syntax, example(numlist)

if ( "`example'" == "1") {

	datalib, country(pan) year(2001 2009) type(cedlas) append incppp(ipcf ila itran ijubi icap ionl renta_imp) clear

	keep if ipcf!=. & cohh==1

	replace renta_imp_ppp = renta_imp_ppp/miembros 

	foreach var in ila_ppp itran_ppp ijubi_ppp icap_ppp ionl_ppp  {
		egen aux = sum(`var') if hogarsec==0, by(ano id)
		replace `var' = aux/miembros
		drop aux
	}

	egen others = rsum(ionl_ppp renta_imp_ppp)

	local varlist "ipcf_ppp ila_ppp itran_ppp ijubi_ppp icap_ppp others"
	sum `varlist'


	decomp `varlist' [w=pondera], by(ano) eq(c1+c2+c3+c4+c5) varpl(lp_2usd_ppp) in(fgt0 fgt1 fgt2 gini theil)
	mat result = r(b)


	mat colnames  result = indicator effect rate

	drop _all
	svmat double result, n(col)

	label define indicator 0 "FGT0" 1 "FGT1" 2 "FGT2" 3 "Gini" 4 "Theil"
	label values indicator indicator


	label define effect ///
		1 "Labor" ///
		2 "Transfer" ///
		3 "Pension" ///
		4 "Capital" ///
		5 "Others" ///
		6 "Total change"
	label values effect effect

	local total 6
	gen aux=rate if  effect==`total'  
	egen total_effect=sum(aux) , by(indicator)
	drop aux
	gen share_effect= -100*rate/abs(total_effect)

	graph bar share_effect if effect!=6, over(effect) by(indicator)
}

end
