#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
    ## Navigation Bar containing Main Tab components
    navbarPage("Cars Data - Prediction of mpg using Regression Analysis",
               tabPanel("Simple Regression",
                        (fluidPage(
                            titlePanel("Predicting Miles per Gallon (mpg) with Simple Regression Models"),
                            ## sidebar containing input components
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Select Input for Simple Regression",
                                                c("am","cyl","hp","wt","disp","drat","qsec","gear","carb")),
                                    checkboxInput("simple_model","Show Simple Model",value=FALSE),
                                    submitButton("Submit")
                                    
                                    
                                ),
                                mainPanel(
                                    h3("Simple Regression Model"),
                                    textOutput("model"),
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("Distribution", plotOutput("histplot"),textOutput("histtext")),
                                                tabPanel("BoxPlot", plotOutput("simpleboxplot"),textOutput("simpletext")),
                                                tabPanel("Scatter Plot", plotOutput("scplot"),textOutput("sctext")),
                                                tabPanel("Summary", verbatimTextOutput("simplesummary")),
                                                tabPanel("t-test", verbatimTextOutput("testsummary")),
                                                tabPanel("Residual Plots", plotOutput("simpleresidual"))
                                                
                                                
                                                
                                    )
                                )
                            )
                            
                        ))),
               tabPanel("Multivariable Regression (Full)",
                        fluidPage(
                          titlePanel("Regression with All Variables for mpg Prediction"),
                          sidebarLayout(
                            sidebarPanel(
                              checkboxInput("multimodel","show full regression model",value=FALSE),
                              submitButton("Submit")
                            ),
                            mainPanel(
                              h3("Multivariable Regression Model"),
                              textOutput("fullmodel"),
                              tabsetPanel(type = "tabs", 
                                          
                                          tabPanel("Summary Full", verbatimTextOutput("multisummary")),
                                          tabPanel("Correlations", plotOutput("expplot"),textOutput("exptext")),
                                          tabPanel("Residual Plots Full", plotOutput("multiresidual"))
                                          
                              )
                              
                            )
                          )
                        )
                        
               ),
               tabPanel("Multivariable Regression (Features Selection)",
                        fluidPage(
                          titlePanel("Regression with Best Variables for mpg Prediction"),
                          sidebarLayout(
                            sidebarPanel(
                              checkboxInput("show","Show/Hide Best Variable Subsets",value = FALSE),
                              checkboxInput("variablenum","Show/Hide Best Variable Number",value = FALSE),
                              checkboxInput("variables","Show/Hide Best Variables",value = FALSE),
                              
                              submitButton("Submit")
                              
                              
                            ),
                            mainPanel(
                              h3("Best Subset Regression Model"),
                              verbatimTextOutput("bestvariablesubsets"),
                              verbatimTextOutput("variablenumber"),
                              verbatimTextOutput("bestvariables"),
                              
                              tabsetPanel(type = "tabs", 
                                          
                                          tabPanel("Summary ", verbatimTextOutput("multisummary2")),
                                          tabPanel("Residual Plots", plotOutput("multiresidual2"))
                                          
                                          
                                          
                              )
                              
                            )
                          )
                        )
                        
               ),
               
               tabPanel("Documentation",
                        mainPanel(
                          h2("Regression Analysis using Shiny Application"),
                          br(),
                          h3("Introduction"),
                          p("In this shiny application we try to give an answer to an essential question for every car enthustiast. By looking at a data set of a collection of cars, we are interested in exploring the relationship between a set of variables and miles per gallon (MPG) as outcome.In order to answer these questions we performed exploratory data analyses, and used hypothesis testing and linear regression as methodologies to make inference. We established both simple and multivariate linear regression analysis. However the result of the multivariable regression model is more promising as it includes the potential effect of other variables on MPG."),
                          h3("Data"),
                          p("For the purpose of this analysis we use mtcars dataset which is a dataset that was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). Below is a brief description of the variables in the data set:"),
                          h4("[, 1]   mpg     Miles/(US) gallon"),
                          h4("[, 2]   cyl     Number of cylinders"),
                          h4("[, 3]   disp    Displacement (cu.in.)"),
                          h4("[, 4]   hp      Gross horsepower"),
                          h4("[, 5]   drat    Rear axle ratio"),
                          h4("[, 6]   wt      Weight (lb/1000)"),
                          h4("[, 7]   qsec    1/4 mile time"),
                          h4("[, 8]   vs      V/S"),
                          h4("[, 9]   am      Transmission (0 = automatic, 1 = manual)"),
                          h4("[,10]   gear    Number of forward gears"),
                          h4("[,11]   carb    Number of carburetors"),
                          h3("How to Explore Application"),
                          p("* Use the __Simple Regression__ Tab to perform univariate regression analysis of mpg with other variables and analyze t he distribution of variables along with correlation of the variables with each other. The summary tab shows the model summary for regression of mpg with the specific variable. The t-test tab shows the results of t-test between mpg and am variable to know if an automatic or manual transmission better for MPG. The select option in left side panel can be used to filter variable for the simple regression analysis. The checkbox can be used to show/hide the model."),
                          p("* Use the __Multivariate Regression (Full)__ Tab to perform multivariate regression analysis of mpg with all other variables. The checkbox in the left panel can be used to show/hide the model.The summary tab shows the full model summary. The correlation tab shows the correlation matrix of variables. The residul plots tab show the model fit plots"),
                          p("* Use the __Multivariate Regression (Feature Selection)__ Tab to perform multivariate regression analysis of mpg with best feature set selected. The checkbox in the left panel can be used to show/hide the model for showing selected features and number of features.The summary tab shows the selected feature set regression model summary. The residual plots tab show the selected feature set regression model fit plots.")
                          
                            
                        )
               ) # End About Tab Panel             
               
               
    ))
