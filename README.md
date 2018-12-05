# ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure

## Description

adecomp implements the shapley decomposition of changes in a welfare indicator as proposed by Azevedo, Sanfelicce and Minh (2012). Following Barros et al (2006), this method takes advantage of the additivity property of a welfare aggregate to construct a counterfactual unconditional distribution of the welfare aggregate by changing each component at a time to calculate their contribution to the observed changes in poverty and inequality.
 

Given that the distribution of a observable welfare measure (i.e. income or consumption) for period 0 and period 1 are known, we can construct counterfactual distributions for period 1 by substituting the observed level of the indicators c in period 0, one at a time. For each counterfactual distribution, we can compute the poverty or inequality measures, and interpret those counterfactuals as the poverty or inequality level that would have prevailed in the absence of a change in that indicator.
 

As much of the micro-decomposition literature, approaches of this nature traditionally suffer from path-dependence (See Essama-Nssah (2012), Fortin et al (2011) and Ferreira (2010) for recent reviews of the literature), in other words, the order in which the cumulative effects are calculated matters . One of the major contributions of Azevedo, Sanfelicce and Minh (2012) is the implementation of the best known remedy for path-dependence which is to calculate the decomposition across all possible paths and then take the average between them. These averages are also known as the Shapley-Shorrocks estimates of each component, implying that we estimate every possible path to decompose these components and then take the average of these estimates (See Shapley (1953) and Shorrocks (1999)).
   

There is one remaining caveat to this approach: the counterfactual income distributions on which these decompositions suffer from equilibrium-inconsistency. Since we are modifying only one element at a time, the counterfactuals are not the result of an economic equilibrium, but rather a statistical exercise in which we assume that we can in fact modify one factor at a time and keep everything else constant.

For further examples of implementations of this approach please see Azevedo, Inchausete and Sanfelice (2012).

## References

[Azevedo, Joao Pedro,  Minh C. Nguyen, Viviane Sanfelice (2012) Shapley decomposition by components of a welfare aggregate. Washington, DC: World Bank.](https://github.com/jazevedo75/adecomp/blob/master/doc/paper_decomp_shapley_income%406.pdf)

[Azevedo, Joao Pedro & Inchauste, Gabriela & Sanfelice, Viviane, 2013. "Decomposing the recent inequality decline in Latin America," Policy Research Working Paper Series 6715, The World Bank.](http://hdl.handle.net/10986/16931)

[Azevedo, Joao Pedro & Inchauste, Gabriela & Olivieri, Sergio & Saavedra, Jaime & Winkler, Hernan, 2013. "Is labor income responsible for poverty reduction ? a decomposition approach," Policy Research Working Paper Series 6414, The World Bank.](http://hdl.handle.net/10986/15552)

[Inchauste, Gabriela; Azevedo, João Pedro; Essama-Nssah, B.; Olivieri, Sergio; Van Nguyen, Trang; Saavedra-Chanduvi, Jaime; Winkler, Hernan. 2014. Understanding Changes in Poverty. Directions in Development--Poverty;. World Bank Group, Washington, DC. © World Bank.](http://hdl.handle.net/10986/19445)

## Suggested Citation

[Azevedo, Joao Pedro, Minh Cong Nguyen, and Viviane Sanfelice, 2012. "ADECOMP: Stata module to estimate Shapley Decomposition by Components of a Welfare Measure," Statistical Software Components S457562, Boston College Department of Economics.](https://ideas.repec.org/c/boc/bocode/s457562.html)

Handle: RePEc:boc:bocode:s457562 


## Note: 

This module should be installed from within Stata by typing "ssc install adecomp". Windows users should not attempt to download these files with a web browser.
