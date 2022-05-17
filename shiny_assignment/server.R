library(shiny)
library(ggplot2)
data(mtcars)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
mtcars$am <- factor(mtcars$am,labels=c("Automatic","Manual"))

shinyServer(function(input, output) {
    
    full_model<-lm(mpg ~ am+cyl+hp+wt+disp+hp+drat+qsec+gear+carb,data=mtcars)
    best_model<-lm(mpg ~ am+hp+wt+disp+qsec,data=mtcars)
    
    formula<-reactive({
        paste("mpg ~", input$variable)
        
    })
    fit_simple<-reactive({
        lm(as.formula(formula()),data=mtcars)
    })
    
    output$model<-renderText({
        if(input$simple_model)
        {formula()}
    })
    
    output$histplot <- renderPlot({
        data <- as.numeric(mtcars[,input$variable])
        hist(data, xlab=input$variable, ylab="Frequency", main = paste("Histogram of" , input$variable), col="steelblue")
    })  
    
    
    output$simpleboxplot <- renderPlot({
        # check for the input variable
        if (input$variable == "am") {
            # am
            mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]], labels = c("Automatic", "Manual")))
            p <- ggplot(mpgData, aes(var, mpg,fill=var)) + 
                geom_boxplot(alpha=0.3) + 
                xlab(input$variable)
            print(p)
            
        }
        else if(input$variable == "cyl"|input$variable == "vs"|input$variable == "gear"|input$variable == "carb"){
            # cyl and gear
            mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
            p <- ggplot(mpgData, aes(var, mpg,fill=var)) + 
                geom_boxplot(alpha=0.3) + 
                xlab(input$variable)
            print(p)
            
        }
        else{
            output$simpletext<-renderText({
                
                
                if (input$variable!= "am"|input$variable != "cyl"|input$variable!= "vs"|input$variable!= "gear"|input$variable!= "carb"){
                    
                    print("We don't have a categorical grouping variable!")
                }
                
            })
            
        }
        
    })
    

    output$scplot <- renderPlot({
        data <- as.numeric(mtcars[,input$variable])
        plot(mtcars$mpg, data, xlab = "mpg", ylab = input$variable, pch = 19)
        abline(lm(data ~ mtcars$mpg), col = "blue")
    })  
    
    output$expplot <- renderPlot({
        mtcars_vars <- mtcars
        mar.orig <- par()$mar # save the original values
        par(mar = c(1, 1, 1, 1)) # set your new values
        pairs(mtcars_vars, panel = panel.smooth, col = 9 + mtcars$wt, main = "Scatter plot matrix for mtcars dataset")
    })  
    
    
    
            
    output$simplesummary<-renderPrint({
        summary(fit_simple())
    })
    
    output$testsummary<-renderPrint({
        if (input$variable == "am") {   
            
            data <- as.numeric(mtcars[,input$variable])
            test <- t.test(mpg ~ data, data= mtcars, var.equal = FALSE, paired=FALSE ,conf.level = .95)
            result <- data.frame( "t-statistic"  = test$statistic, 
                                  "df" = test$parameter,
                                  "p-value"  = test$p.value,
                                  "lower CL" = test$conf.int[1],
                                  "upper CL" = test$conf.int[2],
                                  "automatic mean" = test$estimate[1],
                                  "manual mean" = test$estimate[2],
                                  row.names = "")
            #kable(x = round(result,3),align = 'c')
            result
        }
        else
        {
            print("t-test not applicable")
        }
    })  
    
    
    output$simpleresidual<-renderPlot({
        
        par(mfrow = c(2, 2), bg="pink")
        plot(fit_simple())
    })
    
    output$multisummary<-renderPrint({
        summary(full_model)
        
        
    })
    
    output$multiresidual<-renderPlot({
        
        par(mfrow = c(2, 2), bg="pink")
        plot(full_model)
    })

    output$fullmodel<-renderText({
        
        if(input$multimodel)
        {print("mpg ~ am+cyl+hp+wt+disp+hp+drat+qsec+gear+carb")}
    })
    


    
    output$multisummary2<-renderPrint({
        summary(best_model)
    })
    
    output$multiresidual2<-renderPlot({
        
        par(mfrow = c(2, 2), bg="pink")
        plot(best_model)
    })
})