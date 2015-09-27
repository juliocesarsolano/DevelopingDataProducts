# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
shinyUI(pageWithSidebar(
        # Application title
        headerPanel("Predicting the price of a gemstone"),
        sidebarPanel(
                h4('Choose the size of the gemstone in carat.'),
                sliderInput('carat', 'carat', 0.3, min=0.1, max=0.5, step=0.01)
        ),
        mainPanel(
                h3('Price prediction'),
                p('In this simple app, you can predict the price of the gemstone by its size, based on dataset \'gemstone\' given in UsingR package.'),
                p('If you choose the gemstone size in the left side, the predicted price will be shown below with the 95% prediction interval.'),
                p('The price and the prediction interval (the lower and upper limits) is found using the linear regression model.'),
                h4('You entered'),
                verbatimTextOutput("carat"),
                h4('Price'),
                verbatimTextOutput("price"),
                h4('Prediction interval (95%)'),
                verbatimTextOutput("interval")
        )
))
