# ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure

## Description

adecomp implements the shapley decomposition of changes in a welfare indicator as proposed by Azevedo, Sanfelicce and Minh (2012). Following Barros et al (2006), this method takes advantage of the additivity property of a welfare aggregate to construct a counterfactual unconditional distribution of the welfare aggregate by changing each component at a time to calculate their contribution to the observed changes in poverty and inequality.
 

Given that the distribution of a observable welfare measure (i.e. income or consumption) for period 0 and period 1 are known, we can construct counterfactual distributions for period 1 by substituting the observed level of the indicators c in period 0, one at a time. For each counterfactual distribution, we can compute the poverty or inequality measures, and interpret those counterfactuals as the poverty or inequality level that would have prevailed in the absence of a change in that indicator.
 

As much of the micro-decomposition literature, approaches of this nature traditionally suffer from path-dependence (See Essama-Nssah (2012), Fortin et al (2011) and Ferreira (2010) for recent reviews of the literature), in other words, the order in which the cumulative effects are calculated matters . One of the major contributions of Azevedo, Sanfelicce and Minh (2012) is the implementation of the best known remedy for path-dependence which is to calculate the decomposition across all possible paths and then take the average between them. These averages are also known as the Shapley-Shorrocks estimates of each component, implying that we estimate every possible path to decompose these components and then take the average of these estimates (See Shapley (1953) and Shorrocks (1999)).
   

There is one remaining caveat to this approach: the counterfactual income distributions on which these decompositions suffer from equilibrium-inconsistency. Since we are modifying only one element at a time, the counterfactuals are not the result of an economic equilibrium, but rather a statistical exercise in which we assume that we can in fact modify one factor at a time and keep everything else constant.

For further examples of implementations of this approach please see Azevedo, Inchausete and Sanfelice (2012).


### Where

   - welfarevar is the welfare aggregate variable.

   - components are the components used to construct the welfare variable, and which will be for the decomposition.

   - by is the comparison indicator. It must take two categorical values and is usually defines two points in time or two
    geographic locations, which the difference of the indicator of choice is being decomposed.

   - equation() captures the relationship between welfarevar and components.  The component variables in varlist must be
    denoted by c#, and must be separated by an arithmetic operator.


## References

[Azevedo, Joao Pedro,  Minh C. Nguyen, Viviane Sanfelice (2012) Shapley decomposition by components of a welfare aggregate. 
Washington, DC: World Bank.](https://github.com/jazevedo75/adecomp/blob/master/doc/paper_decomp_shapley_income%406.pdf)

[Azevedo, Joao Pedro & Inchauste, Gabriela & Sanfelice, Viviane, 2013. "Decomposing the recent inequality decline in 
Latin America," Policy Research Working Paper Series 6715, The World Bank.](http://hdl.handle.net/10986/16931)

[Azevedo, Joao Pedro & Inchauste, Gabriela & Olivieri, Sergio & Saavedra, Jaime & Winkler, Hernan, 2013. "Is labor 
income responsible for poverty reduction ? a decomposition approach," Policy Research Working Paper Series 6414, The 
World Bank.](http://hdl.handle.net/10986/15552)

[Barros, Ricardo Paes de. Carvalho, Mirela de. Franco, Samuel. Mendoça, Rosane (2006). "Uma Análise das Principais 
Causas da Queda Recente na Desigualdade de Renda Brasileira." In: Revista Econômica. Volume 8, número 1, p.117-147. 
Universal Federal Fluminense. Rio de Janeiro.](http://www.uff.br/revistaeconomica/V8N1/RICARDO.PDF)

Essama-Nssah, B. (2012). "Identification of Sources of Variation in Poverty Outcomes", World Bank Policy Research 
Working Papers, No. 5954.

Ferreira Francisco H.G. (2010) "Distributions in Motion: Economic Growth, Inequality and Poverty Dynamics".  World Bank 
Policy Research Working Paper No. 5424.  The World Bank, Washington, D.C.

Fortin Nicole, Lemieux Thomas and Firpo Sergio. (2011). "Decomposition Methods in Economics".  In: Ashenfelter Orley 
and Card David (eds) Handbook of Labor Economics, Vol. 4A , pp. 1-102. Northolland, Amsterdam..

[Inchauste, Gabriela; Azevedo, João Pedro; Essama-Nssah, B.; Olivieri, Sergio; Van Nguyen, Trang; Saavedra-Chanduvi, 
Jaime; Winkler, Hernan. 2014. Understanding Changes in Poverty. Directions in Development--Poverty;. World Bank Group, 
Washington, DC. © World Bank.](http://hdl.handle.net/10986/19445)

Shapley, L. (1953). "A value for n-person games", in: H. W. Kuhn and A. W. Tucker (eds.), Contributions to the Theory 
of Games, Vol. 2 (Princeton, N.J.: Princeton University Press).

Shorrocks, Anthony (2012) Decomposition procedures for distributional analysis: a unified framework based on the 
Shapley value. Journal of Economic Inequality  (link to publication)

[World Bank. 2012. The effect of women's economic power in Latin America and the Caribbean (English). Latin America 
and the Caribbean poverty and labor brief. Washington, DC: World Bank. ](http://documents.worldbank.org/curated/en/731771468010902462/The-effect-of-womens-economic-power-in-Latin-America-and-the-Caribbean )


## Suggested Citation

[Azevedo, Joao Pedro, Minh Cong Nguyen, and Viviane Sanfelice, 2012. "ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure," Statistical Software Components S457562, Boston College Department of Economics, revised 12 Jan 2019.](https://ideas.repec.org/c/boc/bocode/s457562.html)

#### Handle: RePEc:boc:bocode:s457562 

#### Note: 
This module should be installed from within Stata by typing "ssc install adecomp". Windows users should not attempt to download these files with a web browser.

#### Keywords
Poverty, Inequality, Decomposition, Nonparametric


## Authors: 

  **João Pedro Azevedo**  
  [jazevedo@worldbank.org](mailto:jazevedo@worldbank.org)  
  World Bank  
  [personal page](http://www.worldbank.org/en/about/people/j/joao-pedro-azevedo)  

  **Minh Cong Nguyen**  
  [mnguyen3@worldbank.org](mailto:mnguyen3@worldbank.org)  
  World Bank  

  **Viviane Sanfelice**  

