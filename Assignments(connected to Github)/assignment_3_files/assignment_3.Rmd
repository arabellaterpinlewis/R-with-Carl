---
title: "assignment_3.Rmd"
author: "Arabella"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE, message=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(dplyr)
library(knitr)
library(kableExtra)
library(usethis)
```

## **Exercise 1. Corruption and human development**
This exercise explores a dataset containing the human development index (`HDI`) and corruption perception index (`CPI`) of 173 countries across 6 different regions around the world: Americas, Asia Pacific, Eastern Europe and Central Asia (`East EU Cemt`), Western Europe (`EU W. Europe`), Middle East and North Africa and Noth Africa (`MENA`), and Sub-Saharan Africa (`SSA`). (Note: the larger `CPI` is, the less corrupted the country is perceived to be.)


First, we load the data using the following code.
```{r}
economist_data <- read.csv("https://raw.githubusercontent.com/nt246/NTRES6940-data-science/master/datasets/EconomistData.csv")
```

**1.1 Show the first few rows of `economist_data.`**
```{r, echo=FALSE}
head(economist_data) %>%
  kable(caption = "") %>%
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "bordered"))
```
**1.2 Explore the relationship between human development index (`HDI`) and corruption perception index (`CPI`) with a scatter plot as the following.**

```{r, echo=FALSE}
ggplot(data = economist_data) + 
  geom_point(mapping = aes(x = CPI, y = HDI))
```

**1.3 Make the color of all points in the previous plot red.**
```{r, echo=FALSE}
ggplot(data = economist_data) + 
  geom_point(mapping = aes(x = CPI, y = HDI), color = "red")
```

**1.4 Color the points in the previous plot according to the `Region variable`, and set the size of points to 2.**
```{r, echo=FALSE}
ggplot(data = economist_data) + 
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region))
```

**1.5 Set the size of the points proportional to `HDI.Rank`**
```{r, echo=FALSE}
ggplot(data = economist_data) + 
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region, size = HDI.Rank))

```

**1.6 Fit a smoothing line to all the data points in the scatter plot from Exercise 1.4**
```{r, echo=FALSE, message=FALSE}
ggplot(data = economist_data) + 
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region)) +
  geom_smooth(mapping = aes(x = CPI, y = HDI))
```

**1.7 Fit a separate straight line for each region instead, and turn off the confidence interval.**
```{r, echo=FALSE, message=FALSE}
ggplot(economist_data, aes(x = CPI, y = HDI, color = Region)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

```

**1.8 Building on top of the previous plot, show each `Region` in a different facet.**
```{r, echo=FALSE, message=FALSE}
ggplot(economist_data, aes(x = CPI, y = HDI, color = Region)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) + 
  facet_wrap(~Region, nrow=2)
```

**1.9 Show distribution of `HDI` in each region using density plot. Set transparency to 0.5**
```{r}
ggplot(data = economist_data) + 
  geom_density(mapping = aes(x = HDI, fill = Region), alpha = .5) 
  
```

**1.10 Show the distribution of `HDI` in each region using histogram and faceting.**
```{r, echo=FALSE, message=FALSE}
ggplot(economist_data) + 
  geom_histogram(mapping = aes(x = HDI, fill=Region)) +
facet_wrap(~Region)
```

**1.11 Show the distribution of `HDI` in each region using a box plot. Set the transparency of these boxes to 0.5. Also show data points for each country in the same plot (Hint: `geom_jitter()` or `position_jitter()` might be useful.)**
```{r,echo=FALSE, message=FALSE}
ggplot(economist_data, aes(x=Region, y=HDI)) + 
  geom_boxplot(aes(fill=Region, color=Region), alpha =.5) + 
  geom_jitter(aes(color=Region))
```

**1.12 Show the count of countries in each region using a bar plot**
```{r}
ggplot(economist_data) + 
  geom_bar(mapping=aes(x=Region))
```

**1.13  You have now created a variety of different plots of the same dataset. Which of your plots do you think are the most informative? Describe briefly the major trends that you see in the data**

Answer: I think the boxplot makes it easiest to compare regions and their HDI values. The dot plots are on a continuum and make it difficult to compare across regions, especially because they're more meant to show trends rather than quantities. 

## **Exercise 2. Unemployment in the US 1967-2015**
This excercise uses the dataset `economics` from the ggplot2 package. It was produced from US economic time series data available from http://research.stlouisfed.org/fred2. It descibes the number of unemployed persons (`unemploy`), among other variables, in the US from 1967 to 2015.

```{r}
head(economics) %>%
  kable(caption = "") %>%
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "bordered"))
```

**2.1 Plot the trend in number of unemployed persons (`unemploy`) though time using the economics dataset shown above. And for this question only, hide your code and only show the plot.**
```{r, echo=FALSE}
ggplot(economics) + 
  geom_line(aes(x=date, y=unemploy))
```

**2.2 Edit the plot title and axis labels of the previous plot appropriately. Make y axis start from 0. Change the background theme to what is shown below. (Hint: search for help online if needed)**
```{r}
ggplot(economics) + 
  geom_line(aes(x=date, y=unemploy)) +
  expand_limits(y=0) +
  theme_minimal()+
  labs(x ="Year", y ="Number of unemployed persons (in thousands)", title = "Unemployment in the US 1967-2015")
```

