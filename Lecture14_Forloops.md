`for loop` exercises
================

<br>

## Gapminder data

Today, we’ll be using a subset of the [Gapminder
dataset](https://www.gapminder.org/tools/?from=world#$chart-type=bubbles),
which represents the health and wealth of nations. It was pioneered by
[Hans Rosling](https://www.ted.com/speakers/hans_rosling), who is famous
for describing the prosperity of nations over time through famines, wars
and other historic events with this beautiful data visualization in his
[2006 TED Talk: The best stats you’ve ever
seen](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen).

INSERT THE IMAGE FOUND AT THIS URL:
<https://s3-eu-west-1.amazonaws.com/static.gapminder.org/GapminderMedia/wp-uploads/20180914115336/Screen-Shot-2018-09-14-at-12.51.17-1024x557.png>

<figure>
<img
src="https://s3-eu-west-1.amazonaws.com/static.gapminder.org/GapminderMedia/wp-uploads/20180914115336/Screen-Shot-2018-09-14-at-12.51.17-1024x557.png"
alt="Image_1" />
<figcaption aria-hidden="true">Image_1</figcaption>
</figure>

<br> <br>

We will use a subset of the gapminder data included in the R package
`gapminder`. So first we need to install that package and load it, along
with the tidyverse. Then have a look at the data in `gapminder`

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.5.3

    ## Warning: package 'dplyr' was built under R version 4.5.3

``` r
library(gapminder) #install.packages("gapminder")
```

    ## Warning: package 'gapminder' was built under R version 4.5.3

``` r
gapminder
```

    ## # A tibble: 1,704 × 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.
    ## # ℹ 1,694 more rows

<br>

Here is the for loop we created together to save plots of gdp_per_cap
vs. year for all countries in the dataset:

``` r
# Clean up variable names
gapminder <- gapminder |> 
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)

dir.create("gap_figs") 
```

    ## Warning in dir.create("gap_figs"): 'gap_figs' already exists

``` r
## create a list of countries
country_list <- unique(gapminder$country) # ?unique() returns the unique values

for (cntry in country_list) {
  
  ## filter the country to plot
  gap_to_plot <- gapminder |>
    filter(country == cntry)
  
  ## plot
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdp_per_cap)) + 
    geom_point() +
    ## add title and save
    labs(title = str_c(cntry, "GDP per capita", sep = " "))
  
  ## add the gap_figs/ folder
  ggsave(filename = str_c("gap_figs/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)
} 
```

This code has been copied to the code chunk below.

<br> <br>

### Your task:

1.  Modify our `for` loop so that it:
    - loops through countries in Europe only
    - plots the product of gdpPercap and population size per year
      (should approximate the total GDP) instead of the gdpPercap
    - saves them to a new subfolder inside the (recreated) gap_figs
      folder called “Europe”.
2.  Sync to GitHub

<br>

``` r
## create a list of countries
country_list <- unique(gapminder$country) # ?unique() returns the unique values

for (cntry in country_list) {
  
  ## filter the country to plot
  gap_to_plot <- gapminder |>
    filter(country == cntry)
  
  ## plot
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdp_per_cap)) + 
    geom_point() +
    ## add title and save
    labs(title = str_c(cntry, "GDP per capita", sep = " "))
  
  ## add the gap_figs/ folder
  ggsave(filename = str_c("gap_figs/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)
} 
```

<br>
