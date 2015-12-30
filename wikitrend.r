if(!require(stringi)) install.packages("stringi")
if(!require(curl)) install.packages("curl")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("petermeissner/wikipediatrend")
devtools::install_github("twitter/AnomalyDetection")
if(!require(Rcpp) install.packages("Rcpp")
if(!require(ggplot2)) install.packages("ggplot2")
   
library(wikipediatrend) ## Library containing API wikipedia access   
library(AnomalyDetection)
library(ggplot2)

## Download wiki webpage "fifa" 
npt = wp_trend("Nguyễn Phú Trọng", from="2013-01-01", lang = "en")
ntd = wp_trend("Nguyễn Tấn Dũng", from="2013-01-01", lang = "en")
nsh = wp_trend("Nguyễn Sinh Hùng", from="2013-01-01", lang = "en")
tts = wp_trend("Trương Tấn Sang", from="2013-01-01", lang = "en")

npt$title="Nguyen Phu Trong"
ntd$title="Nguyen Tan Dung"
nsh$title="Nguyen Sinh Hung"
tts$title="Truong Tan Sang"
dat=do.call("rbind",list(npt,ntd,nsh,tts))

## Plotting data
ggplot(dat, aes(x=date, y=count, color=title)) + geom_line()
