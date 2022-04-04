### Description
TDT-like-tests is intended to be a suite of R functions for implementing modified transmission disequilibrium tests (TDT) to hybrid designs (e.g., case-parent/control-parent trios) on a genome-wide scale. 

Currently, it has one function `TDT.DCtrios` that implements two TDT-like-tests for case-parent/control-parent trio design. It is based on the statistical methods proposed in Deng & Chen (2001), and as used in Ray et al. (2022). Please refer/cite *both* articles if this function is used:

1. Deng, H.W. and Chen, W.M. (2001). "The power of the transmission disequilibrium test (TDT) with both case-parent and control-parent trios". *Genetics Research*, 78:289-302. https://doi.org/10.1017/s001667230100533x

2. Ray, D., Vergara, C., Taub, M.A., Wojcik, G., Ladd-Acosta, C., Beaty, T.H., and Duggal, P. (2022) "Benchmarking statistical methods for analyzing parent-child dyads in genetic association studies". *Genetic Epidemiology* (to appear).

**Key Words:** Case-parent/control-parent; Family-based GWAS; Hybrid design; Offspring design; Transmission disequilibrium; Trios


### Requirements
R (>= 3.0.1)


### How to Install within R
```{r}
require(devtools)
source_url("https://github.com/RayDebashree/GxE/blob/main/joint_metaanalysis_2df_GxE.R?raw=TRUE")
```
It is recommended to download/copy the stand-alone R program in this repository, save it in your local directory of choice and `source()` it from your local directory. When a new version of the software is available, older versions may be removed from this repository, and the above `devtools::source_url()` technique may not work.


### Usage

#### Simple example
```{r}
JMA2df(SNP.coef, GXE.coef, SNP.se, GXE.se, SNP.GXE.cov=NULL, trio.package.input=FALSE)
```
#### Arguments
| Input | Description |
| ---: | --- |
| `SNP.coef` | The vector of estimated SNP effects of size `k` from a 2 degree of freedom (df) gene-environment model, where `k`(>1) is the number of studies from which the SNP effects are obtained. In other words, a model with main effect G and interaction effect GxE are fit for each of the `k` independent studies to be meta-analyzed, and `SNP.coef` contains all the coefficient estimates for G. |
| `GXE.coef` | The vector of estimated GxE effects, from the afore-mentioned model, of size `k` . |
| `SNP.se` | The vector of estimated standard errors of SNP effects, from the afore-mentioned model, of size `k`. |
| `GXE.se` | The vector of estimated standard errors of GxE effects, from the afore-mentioned model, of size `k`. |
| `SNP.GXE.cov` | The vector of estimated covariance between SNP and GxE effects, from the afore-mentioned model, of size `k`. |
| `trio.package.input` | If the SNP and GxE effect estimates are obtained from the [R trio package](https://www.bioconductor.org/packages/release/bioc/html/trio.html) (as used in Zhang et al, 2021+), then no input should be given for `SNP.GXE.cov`. |

#### Value
| Output | Description |
| ---: | --- |
| `SNP.coef.JMA` | Jointly meta-analyzed SNP effect for a 2-df model with main effect G and gene-environment interaction effect GxE. |
| `GXE.coef.JMA` | Jointly meta-analyzed GxE effect for the afore-mentioned 2-df model. |
| `SNP.se.JMA` | Jointly meta-analyzed standard error of SNP effect estimate for the afore-mentioned 2-df model. |
| `GXE.se.JMA` | Jointly meta-analyzed standard error of GxE effect estimate for the afore-mentioned 2-df model. |
| `SNP.GXE.cov.JMA` | Jointly meta-analyzed covariance between SNP and GxE effect estimates for the afore-mentioned 2-df model. |
| `wald2df.stat.JMA` | 2-df Wald test statistic for the joint test of SNP and GxE effects. |
| `wald2df.pval.JMA` | P-value of the 2-df Wald test. P-value below chosen threshold (usually the traditional genome-wide threshold of 5e-7) means either or both the SNP and the GxE effects are statistically significantly different from 0. |

