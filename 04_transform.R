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
locations <- read_csv("NCEI-0129877_US_SSL_Sites.csv")


# join the counts and the locations

pups <- left_join(pups_long, locations, by=c("sitename" = "SITENAME")) %>% 
  filter(year == 2015) %>% 
  select(sitename,year,count,LATITUDE,LONGITUDE) %>% 
  rename_all(tolower)

### do some maps of counts

mylocation <- c(-180,50,-130,65)
my_map <- get_stamenmap(mylocation, zoom = 6, maptype = "watercolor")

# map and add counts
ggmap(my_map) +
  geom_point(data = pups,
             aes(x = longitude, y = latitude, size = count),
             alpha = 0.5, shape = 21, col = "darkgray") +
  ggtitle("Steller sea lion pup counts 2015") +
  xlab("Longitude") +
  ylab("Latitude")




