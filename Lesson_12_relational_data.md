Lesson 12
================

We’re working on binding, mutating, and filtering between multiple data
tables

``` r
fship <- read.csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read.csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read.csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")
```

This will bind the separate dataframes together

``` r
lotr_untidy <- dplyr::bind_rows(fship, ttow, rking)
lotr_untidy <- base::rbind(fship, ttow, rking)
```

To practice the `join` functions, subset the `flights` dataframe as
follows
