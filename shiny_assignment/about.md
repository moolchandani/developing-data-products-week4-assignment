# Regression Analysis using Shiny Application
---

## Introduction

In this shiny application we try to give an answer to an essential question for every car enthustiast. By looking at a data set of a collection of cars, we are interested in exploring the relationship between a set of variables and miles per gallon (MPG) as outcome.In order to answer these questions we performed exploratory data analyses, and used hypothesis testing and linear regression as methodologies to make inference. We established both simple and multivariate linear regression analysis. However the result of the multivariable regression model is more promising as it includes the potential effect of other variables on MPG.

## Data

For the purpose of this analysis we use mtcars dataset which is a dataset that was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). Below is a brief description of the variables in the data set:

[, 1]   mpg     Miles/(US) gallon
[, 2]   cyl     Number of cylinders
[, 3]   disp    Displacement (cu.in.)
[, 4]   hp      Gross horsepower
[, 5]   drat    Rear axle ratio
[, 6]   wt      Weight (lb/1000)
[, 7]   qsec    1/4 mile time
[, 8]   vs      V/S
[, 9]   am      Transmission (0 = automatic, 1 = manual)
[,10]   gear    Number of forward gears
[,11]   carb    Number of carburetors

## How to Explore

* Use the __Simple Regression__ Tab to perform univariate regression analysis of mpg with other variables and analyze t he distribution of variables along with correlation of the variables with each other. The summary tab shows the model summary for regression of mpg with the specific variable. The t-test tab shows the results of t-test between mpg and am variable to know if an automatic or manual transmission better for MPG. The select option in left side panel can be used to filter variable for the simple regression analysis. The checkbox can be used to show/hide the model.

* Use the __Multivariate Regression (Full)__ Tab to perform multivariate regression analysis of mpg with all other variables. The checkbox in the left panel can be used to show/hide the model.

* Use the __Multivariate Regression (Feature Selection)__ Tab to perform multivariate regression analysis of mpg with best feature set selected. The checkbox in the left panel can be used to show/hide the model for showing selected features and number of features.The summary tab shows the selected feature set regression model summary. The residual plots tab show the selected feature set regression model fit plots.




