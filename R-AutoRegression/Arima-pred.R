load("C:\\RData\\R-Sample_USDJPY_60.RData")
library("forecast")
library(quantmod)
library(xts)
#library(moments)
tail(h)
is.xts(h)

y <- h["2017-02-20::2017-02-21"]
fit <- auto.arima(y,ic='bic')
arimaorder(fit)
tail(hist_r)
tail(h)
names(h)

pacf(hist_r$Close)
fit <- auto.arima(hist_r$Close)
arimaorder(fit)
arimaforecast <- forecast(fit,h=5)
hist_r$ret <- Delt(hist_r$Close,k=1,type="log")
fit <- auto.arima(hist_r$ret)
arimaorder(fit)
arimaforecast <- forecast(fit,h=5)

# We have forecasted 5 period returns, calculate the expected Close
Fivepoints <- (1+arimaforecast$mean)*tail(hist_r$Close[length(hist_r$Close)])
Fivepoints