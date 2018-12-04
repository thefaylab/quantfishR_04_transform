###

library(tidyverse)
library(ggmap)
library(mapdata)


### count data

pups_wide <- read_csv("SSLpupcounts.csv")

# convert to long
pups_long <- gather(pups_wide, key = "year", value = "count", -sitename) %>% 
  drop_na()

pups_spread <- spread(pups_long, key="year", value = "count")

pups_long

# join data
location <- read_csv("NCEI-0129877_US_SSL_Sites.csv")


