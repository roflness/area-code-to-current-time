x <- read.csv("C:/Users/rafael.reyes/Google Drive/Documents/R/Area Code to Time Zone/data.csv", TRUE, sep=",")
x$Time.New <- rep(NA, nrow(x))
colnames(x) <- c("Area.Code", "Time.Zone", "State", "Region", "Time.New")
new.time <- function(y){
  x$Time.New <- as.POSIXct(ifelse(x$Time.Zone=='EST', Sys.time()+10800,
                                  ifelse(x$Time.Zone=='CST', Sys.time()+7200,
                                  ifelse(x$Time.Zone=='PST', Sys.time(),
                                  ifelse(x$Time.Zone=='MST', Sys.time()+3600,
                                  ifelse(x$Time.Zone=='HAST', Sys.time()-7200,
                                  ifelse(x$Time.Zone=='AST', Sys.time()-14400,
                                  ifelse(x$Time.Zone=='AKST', Sys.time()-3600,
                                  NA))))))), origin="1970-01-01")
  x$Time.New[x$Area.Code == y]

}
