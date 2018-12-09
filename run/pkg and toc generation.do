

makedlg adecomp, ///
	toc pkg title(`"ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure"') ///
	version("1.1") license("MIT") author("Joao Pedro Azevedo") affiliation("World Bank") ///
	url("http://www.worldbank.org/en/about/people/j/joao-pedro-azevedo") email("jazevedo@worldbank.org") ///
	install(`""C:\GitHub_myados\AINEQUAL--Stata-module-to-compute-measures-of-inequality\src\a\ainequal.ado" ///
			"C:\GitHub_myados\AINEQUAL--Stata-module-to-compute-measures-of-inequality\src\a\ainequal.hlp""')
			
			

makedlg adecomp, ///
	replace toc pkg title(`"ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure"') ///
	version("1.1") license("MIT") author("Joao Pedro Azevedo") affiliation("World Bank") ///
	url("http://www.worldbank.org/en/about/people/j/joao-pedro-azevedo") ///
	email("jazevedo@worldbank.org") ///
	install(`""C:\Users\wb255520\Documents\myados\adecomp\src\a\adecomp.ado"  "C:\Users\wb255520\Documents\myados\adecomp\src\a\adecomp.sthlp" "C:\Users\wb255520\Documents\myados\adecomp\src\_\_ex_adecomp.ado""') ///
	ancillary(`""C:\Users\wb255520\Documents\myados\adecomp\src\e\exdata_adecomp.dta""')
