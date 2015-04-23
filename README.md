KIWI
====

Kiwi is a collection of webapps to do common statistical procedures. All apps are implemented using [shiny](http://shiny.rstudio.com/) and powered by [R](http://www.r-project.org/).

### Running Kiwi online

See below on each app's description.

### Running Kiwi locally

You can run any app here as you would any shiny app:

Download [R](http://cran.r-project.org/mirrors.html) and [RStudio](http://www.rstudio.com/). Once in RStudio, install shiny

```
> install.packages("shiny")
```

Download the code and open `ui.R` or `server.R`. Click on the "Run App" button on the bottom right. That's it.

## Apps

#### Bootstrapper

[Run bootstrapper online](http://jjara.shinyapps.io/Bootstrapper/)

Bootstrapper calculates 95% confidence intervals using a basic non-parametric bootstrap. With it you can bootstrap the mean of a variable, the correlation between two variables, or the difference between the means of two variables.

Bootstrapper uses the boot package:

Angelo Canty and Brian Ripley (2015). boot: Bootstrap R (S-Plus) Functions. R package version 1.3-15.
