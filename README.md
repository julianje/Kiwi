KIWI
====

Kiwi is a collection of webapps to do common statistical procedures. All apps are implemented using [shiny](http://shiny.rstudio.com/) and powered by [R](http://www.r-project.org/).

## Use Kiwi online

* [Bootstrap estimates](http://jjara.shinyapps.io/Bootstrapper/)

* [Calculate partial correlations](http://jjara.shinyapps.io/PCor/)

* [Inter-rater reliability tools](http://jjara.shinyapps.io/Coders/)

See below on each app's description.

## Apps

#### Bootstrapper

[Run bootstrapper online](http://jjara.shinyapps.io/Bootstrapper/)

Bootstrapper calculates 95% confidence intervals using a basic non-parametric bootstrap. With it you can bootstrap the mean of a variable, the correlation between two variables, or the difference between the means of two variables.

Bootstrapper uses R's boot package:

Angelo Canty and Brian Ripley (2015). boot: Bootstrap R (S-Plus) Functions. R package version 1.3-15.

#### PCor

[Run PCor online](http://jjara.shinyapps.io/PCor/)

PCor is an interface for calculating partial correlations.

PCor uses the R ppcor package:

Seongho Kim (2012). ppcor: Partial and Semi-partial (Part) correlation. R package version 1.0.
  http://CRAN.R-project.org/package=ppcor

#### Coders

[Run Coders online](http://jjara.shinyapps.io/Coders/)

Coders is an interface for calculating and visualizing inter-rater reliability.

Coders uses the R irr package:

Matthias Gamer, Jim Lemon and Ian Fellows Puspendra Singh (2012). irr: Various Coefficients of Interrater Reliability and Agreement. R package version 0.84. http://CRAN.R-project.org/package=irr

### Running Kiwi locally

You can run any app here as you would any shiny app:

Download [R](http://cran.r-project.org/mirrors.html) and [RStudio](http://www.rstudio.com/). Once in RStudio, install shiny

```
> install.packages("shiny")
```

Download the code and open `ui.R` or `server.R`. Click on the "Run App" button on the top right. That's it.