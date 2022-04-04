###------------- Code for implementing TDT-like-tests in case-parent/control-parent trios -----------------

## Code developed by  : Debashree Ray, PhD, MStat
## Contact info       : dray@jhu.edu
## Last modified      : Nov-10-2020

## Cite the following articles if this function is used:
##	1. Deng HW, Chen WM. (2001). "The power of the transmission disequilibrium test (TDT) with both case-parent 
##     and control-parent trios", Genetics Research, 78:289-302. https://doi.org/10.1017/s001667230100533x 
##  2. Ray, D., Vergara, C., Taub, M.A., Wojcik, G., Ladd-Acosta, C., Beaty, T.H., and Duggal, P. (2022) 
##     "Benchmarking statistical methods for analyzing parent-child dyads in genetic association studies", 
##     Genetic Epidemiology (to appear). Check https://github.com/RayDebashree/TDT-like-tests for updated citation.

message("=====================================================================")
message("     TDT-like-tests for case-parent/control-parent trio design")
message("=====================================================================")
message("Cite the following articles if this program is used:")
message("  1. Deng et al. (2001) 'The power of the transmission disequilibrium test (TDT) with both case-parent")
message("     and control-parent trios', Genetics Research.")
message("  2. Ray et al. (2022) 'Benchmarking statistical methods for analyzing parent-child dyads in genetic")
message("     association studies', Genetic Epidemiology.")
message(" ")
message("Check https://github.com/RayDebashree/TDT-like-tests for complete/updated citations.")
message("=====================================================================")


TDT.DCtrios <- function(Tcase, NTcase, Tcontrol, NTcontrol){
  # row totals for disease status
  n10 <- Tcase + NTcase
  n20 <- Tcontrol + NTcontrol
  # column totals for allele transmitted
  n01 <- Tcase + Tcontrol
  n02 <- NTcase + NTcontrol
  # table total
  n0 <- n10 + n20       # same as n01 + n02
  # test statistic & pvalue for TDT-DC test
  stat1 <- n0*(Tcase*NTcontrol-Tcontrol*NTcase)^2/(n01*n02*n10*n20)
  pval1 <- pchisq(stat1, df=1, ncp=0, lower.tail=FALSE)
  # test statistic & pvalue for TDT-D+C test
  stat2 <- (Tcase-NTcase)^2/(Tcase+NTcase) + (Tcontrol-NTcontrol)^2/(Tcontrol+NTcontrol)
  pval2 <- pchisq(stat2, df=2, ncp=0, lower.tail=FALSE)
  # output
  return(list(Tcase=Tcase, NTcase=NTcase, Tcontrol=Tcontrol, NTcontrol=NTcontrol, Z.TDT.DC=sqrt(stat1), pvalue.TDT.DC=pval1, Z.TDT.DplusC=sqrt(stat2), pvalue.TDT.DplusC=pval2))
}
