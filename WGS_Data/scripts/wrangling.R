scab.data <- read.csv(here("input-data","WDVP_Datasets_SCAB.csv"))

# scab.data <- scab.data[2:73,]

summary(scab.data)

names(scab.data) <- c("country", "population", "gdp.billions", "gdp.capita", "gdp.km2",
                      "land.area.km2","pop.density","foreign.pop","perc.foreign.born",
                      "pop.abroad","perc.pop.abroad","happy.planet.index",
                      "world.happiness.index", "hdi", "health.expenditure.capita",
                      "education.expenditure.capita") 



no.punctuation <- function(x) {
  data <- gsub(',', '', scab.data[,x])
  return(data) 
}

to.numeric <- function(x){
  data <- as.numeric(as.character(scab.data[,x]))
  return(data) 
}



for (i in 2:16) {
  scab.data[,i] <-  no.punctuation(i)
  scab.data[,i] <- to.numeric(i)
}


summary(scab.data)

