### Description
'TDT-like-tests' is intended to be a suite of R functions for implementing modified transmission disequilibrium tests (TDT) on hybrid designs (e.g., case-parent/control-parent trios). 

Currently, it has one function `TDT.DCtrios` that implements two TDT-like-tests for case-parent/control-parent trio design. It is based on the statistical methods proposed in Deng & Chen (2001), and as used in Ray et al. (2022). Please refer/cite *both* articles if this function is used:

1. Deng, H.W. and Chen, W.M. (2001). "The power of the transmission disequilibrium test (TDT) with both case-parent and control-parent trios". *Genetics Research*, 78:289-302. https://doi.org/10.1017/s001667230100533x

2. Ray, D., Vergara, C., Taub, M.A., Wojcik, G., Ladd-Acosta, C., Beaty, T.H., and Duggal, P. (2022) "Benchmarking statistical methods for analyzing parent-child dyads in genetic association studies". *Genetic Epidemiology*. https://doi.org/10.1002/gepi.22453

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
| `Tcase` | The number of times the marker allele is *transmitted* from a parent to an affected child. This relates to the TDT applied to *case-parent trios* only with at least one heterozygous parent. |
| `NTcase` | The number of times the marker allele is *not transmitted* from a parent to an affected child. This relates to the TDT applied to *case-parent trios* only with at least one heterozygous parent. |
| `Tcontrol` | The number of times the marker allele is *transmitted* from a parent to an unaffected child. This relates to the TDT applied to *control-parent trios* only with at least one heterozygous parent. This TDT can be viewed as a test for 'healthy' rather than 'disease' allele, though at the same disease susceptibility locus. |
| `NTcontrol` | The number of times the marker allele is *not transmitted* from a parent to an unaffected child. This relates to the TDT applied to *control-parent trios* only with at least one heterozygous parent. |

#### Value
| Output | Description |
| ---: | --- |
| `Tcase` | Same as input above. |
| `NTcase` | Same as input above. |
| `Tcontrol` | Same as input above. |
| `NTcontrol` | Same as input above. |
| `Z.TDT.DC` | 1-df &chi;<sup>2</sup>-distributed test statistic for TDT<sub>DC</sub>, a contingency table test for association of disease status with allele transmissions from case- and control-parent trios considered jointly. |
| `pvalue.TDT.DC` | P-value of the 1-df TDT<sub>DC</sub> test. |
| `Z.TDT.DplusC` | 2-df &chi;<sup>2</sup>-distributed test statistic for TDT<sub>D+C</sub>, a contingency table test for association of disease status with allele transmissions based on combining the independent TDT statistics from case-parent trios and from control-parent trios separately. |
| `pvalue.TDT.DplusC` | P-value of the 2-df TDT<sub>D+C</sub> test. |

#### Notes
1. To obtain `T` and `NT` values per variant for a specific family type (either case-parent trios or control-parent trios), one may implement `--TDT` option from the GDT software by Chen et al., 2009 (https://www.chen.kingrelatedness.com/software/GDT/).
