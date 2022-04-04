### Description
TDT-like-tests is intended to be a suite of R functions for implementing modified transmission disequilibrium tests (TDT) to hybrid designs (e.g., case-parent/control-parent trios) on a genome-wide scale. 

Currently, it has one function `TDT.DCtrios` that implements two TDT-like-tests for case-parent/control-parent trio design. It is based on the statistical methods proposed in Deng & Chen (2001), and as used in Ray et al. (2022). Please refer/cite *both* articles if this function is used:

1. Deng, H.W. and Chen, W.M. (2001). "The power of the transmission disequilibrium test (TDT) with both case-parent and control-parent trios". *Genetics Research*, 78:289-302. https://doi.org/10.1017/s001667230100533x

2. Ray, D., Vergara, C., Taub, M.A., Wojcik, G., Ladd-Acosta, C., Beaty, T.H., and Duggal, P. (2022) "Benchmarking statistical methods for analyzing parent-child dyads in genetic association studies". *Genetic Epidemiology* (to appear).

**Key Words:** Case-parent/control-parent design; Family-based GWAS; Hybrid design; Offspring design; Transmission disequilibrium; Trios


### Requirements
R (>= 3.0.1)


### How to Install within R
```{r}
require(devtools)
source_url("https://github.com/RayDebashree/TDT-like-tests/blob/main/TDT_DC_tests.R?raw=TRUE")
```
It is recommended to download/copy the stand-alone R program in this repository, save it in your local directory of choice and `source()` it from your local directory. When a new version of the program is available, older versions may be removed from this repository.


### Usage

#### Simple example
```{r}
TDT.DCtrios(Tcase, NTcase, Tcontrol, NTcontrol)
```
#### Arguments
| Input | Description |
| ---: | --- |
| `Tcase` | The vector of estimated SNP effects of size `k` from a 2 degree of freedom (df) gene-environment model, where `k`(>1) is the number of studies from which the SNP effects are obtained. In other words, a model with main effect G and interaction effect GxE are fit for each of the `k` independent studies to be meta-analyzed, and `SNP.coef` contains all the coefficient estimates for G. |
| `NTcase` | The vector of estimated GxE effects, from the afore-mentioned model, of size `k` . |
| `Tcontrol` | The vector of estimated standard errors of SNP effects, from the afore-mentioned model, of size `k`. |
| `NTcontrol` | The vector of estimated standard errors of GxE effects, from the afore-mentioned model, of size `k`. |

#### Value
| Output | Description |
| ---: | --- |
| `Tcase` | Jointly meta-analyzed SNP effect for a 2-df model with main effect G and gene-environment interaction effect GxE. |
| `NTcase` | Jointly meta-analyzed GxE effect for the afore-mentioned 2-df model. |
| `Tcontrol` | Jointly meta-analyzed standard error of SNP effect estimate for the afore-mentioned 2-df model. |
| `NTcontrol` | Jointly meta-analyzed standard error of GxE effect estimate for the afore-mentioned 2-df model. |
| `Z.TDT.DC` | Jointly meta-analyzed covariance between SNP and GxE effect estimates for the afore-mentioned 2-df model. |
| `pvalue.TDT.DC` | 2-df Wald test statistic for the joint test of SNP and GxE effects. |
| `Z.TDT.DplusC` | P-value of the 2-df Wald test. P-value below chosen threshold (usually the traditional genome-wide threshold of 5e-7) means either or both the SNP and the GxE effects are statistically significantly different from 0. |
| `pvalue.TDT.DplusC` | P-value of the 2-df Wald test. P-value below chosen threshold (usually the traditional genome-wide threshold of 5e-7) means either or both the SNP and the GxE effects are statistically significantly different from 0. |

