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
locations <- read_csv("NCEI-0129877_US_SSL_Sites.csv") %>% 
  tolower(names())


# join the counts and the locations

pups <- left_join(pups_long, locations)

