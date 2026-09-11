Assignment 4
================

``` r
library(tidyverse)
library(knitr)
library(gapminder)
library(kableExtra)
```

**Exercise 1. Theophylline experiment**

This exercise uses the `Theoph` data frame (comes with your R
installation), which has 132 rows and 5 columns of data from an
experiment on the pharmacokinetics of the anti-asthmatic drug
theophylline. Twelve subjects were given oral doses of theophylline then
serum concentrations were measured at 11 time points over the next 25
hours. You can learn more about this dataset by running `?Theoph`

Have a look at the data structure

``` r
kable(head(Theoph))
```

| Subject |   Wt | Dose | Time |  conc |
|:--------|-----:|-----:|-----:|------:|
| 1       | 79.6 | 4.02 | 0.00 |  0.74 |
| 1       | 79.6 | 4.02 | 0.25 |  2.84 |
| 1       | 79.6 | 4.02 | 0.57 |  6.57 |
| 1       | 79.6 | 4.02 | 1.12 | 10.50 |
| 1       | 79.6 | 4.02 | 2.02 |  9.66 |
| 1       | 79.6 | 4.02 | 3.82 |  8.58 |

**1.1 Select columns that contain a lower case “t” in the `Theoph`
dataset. Do not manually list all the columns to include.**

| Subject |   Wt |
|:--------|-----:|
| 1       | 79.6 |
| 1       | 79.6 |
| 1       | 79.6 |
| 1       | 79.6 |
| 1       | 79.6 |
| 1       | 79.6 |

**1.2 Rename the `Wt` column to `Weight` and `conc` column to
`Concentration` in the `Theoph` dataset.**

| Subject | Weight | Dose | Time | Concentration |
|:--------|-------:|-----:|-----:|--------------:|
| 1       |   79.6 | 4.02 | 0.00 |          0.74 |
| 1       |   79.6 | 4.02 | 0.25 |          2.84 |
| 1       |   79.6 | 4.02 | 0.57 |          6.57 |
| 1       |   79.6 | 4.02 | 1.12 |         10.50 |
| 1       |   79.6 | 4.02 | 2.02 |          9.66 |
| 1       |   79.6 | 4.02 | 3.82 |          8.58 |

**1.3 Extract the `Dose` greater than 4.5 and `Time` greater than the
mean `Time`.**

| Subject |   Wt | Dose |  Time | conc |
|:--------|-----:|-----:|------:|-----:|
| 3       | 70.5 | 4.53 |  7.07 | 5.30 |
| 3       | 70.5 | 4.53 |  9.00 | 4.90 |
| 3       | 70.5 | 4.53 | 12.15 | 3.70 |
| 3       | 70.5 | 4.53 | 24.17 | 1.05 |
| 5       | 54.6 | 5.86 |  7.02 | 7.09 |
| 5       | 54.6 | 5.86 |  9.10 | 5.90 |

**1.4 Sort the Theoph dataset by Wt from smallest to largest and
secondarily by Time from largest to smallest.**

| Subject |   Wt | Dose |  Time | conc |
|:--------|-----:|-----:|------:|-----:|
| 5       | 54.6 | 5.86 | 24.35 | 1.57 |
| 5       | 54.6 | 5.86 | 12.00 | 4.37 |
| 5       | 54.6 | 5.86 |  9.10 | 5.90 |
| 5       | 54.6 | 5.86 |  7.02 | 7.09 |
| 5       | 54.6 | 5.86 |  5.02 | 7.56 |
| 5       | 54.6 | 5.86 |  3.50 | 8.74 |

**1.5 Create a new column called Quantity that equals to Wt x Dose in
the Theoph dataset. This will tell you the absolute quantity of drug
administered to the subject (in mg). Replace the Dose variable with
Quantity.**

``` r
Theoph_absolute <- mutate(Theoph, Quantity = Wt*Dose) 
kable(Theoph_absolute[1:6,])
```

| Subject |   Wt | Dose | Time |  conc | Quantity |
|:--------|-----:|-----:|-----:|------:|---------:|
| 1       | 79.6 | 4.02 | 0.00 |  0.74 |  319.992 |
| 1       | 79.6 | 4.02 | 0.25 |  2.84 |  319.992 |
| 1       | 79.6 | 4.02 | 0.57 |  6.57 |  319.992 |
| 1       | 79.6 | 4.02 | 1.12 | 10.50 |  319.992 |
| 1       | 79.6 | 4.02 | 2.02 |  9.66 |  319.992 |
| 1       | 79.6 | 4.02 | 3.82 |  8.58 |  319.992 |
