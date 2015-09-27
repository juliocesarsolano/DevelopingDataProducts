library(shiny)

x <- c(0.17, 0.16, 0.17, 0.18, 0.25, 0.16, 0.15, 0.19, 0.21, 0.15, 0.18, 0.28, 0.16, 0.20, 0.23, 
       0.29, 0.12, 0.26, 0.25, 0.27, 0.18, 0.16, 0.17, 0.16, 0.17, 0.18, 0.17, 0.18, 0.17, 0.15, 0.17,
       0.32, 0.32, 0.15, 0.16, 0.16, 0.23, 0.23, 0.17, 0.33, 0.25, 0.35, 0.18, 0.25, 0.25, 0.15, 0.26, 0.15)
y <- c(355,  328,  350,  325,  642,  342,  322,  485,  483,  323,  462,  823,  336,  498,  595,  860,  223,
       663,  750,  720,  468,  345, 352,  332,  353,  438,  318, 419,  346,  315,  350,  918,  919,  298,
       339,  338,  595,  553,  345,  945,  655, 1086,  443,  678, 675,  287,  693,  316)
n <- length(x)

# applying the linear regression model.
beta1 <- cor(y,x) * sd(y) / sd(x) # slope
beta0 <- mean(y) - beta1 * mean(x) # intercept
e <- y - beta0 - beta1 * x # residuals
sigma <- sqrt(sum(e^2)/(n-2)) # sd of residuals
ssx <- sum((x - mean(x))^2)

# function for predicting the price
prediction <- function(carat) beta0 + carat * beta1

# function to calculate prediction interval
interval <- function(carat) {
        se <- sigma * sqrt(1 + 1 / n + (carat - mean(x))^2 / ssx)
        prediction(carat) + c(-1,1) * 2 * se
}

shinyServer(
        function(input, output) {
                output$carat <- renderPrint({input$carat})
                output$price <- renderPrint({prediction(input$carat)})
                output$interval <- renderPrint({interval(input$carat)})
        }
)
