###

library(tidyverse)
library(ggmap)
library(mapdata)


### count data

pups_wide <- read_csv("SSLpupcounts.csv")

# convert to long
pups_long <- gather(pups_wide, )

