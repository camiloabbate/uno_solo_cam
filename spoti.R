
# a ver charts

library(readr)
library(tidyverse)
library(tidylog)


charts <- read_csv("week8_alt/charts/charts.csv")

charts %>% colnames()

charts %>% str()

charts$date %>% unique()

# let's only leave the ones after 2023:

charts <- charts %>% mutate(year = str_sub(date,1,4))

charts$year %>% unique()

charts$year %>% table()

charts <- charts %>% mutate(year = as.numeric(year))

charts_subset <- charts %>% filter(year == 2021)

charts_subset$region %>% unique()

charts_north_and_south_america <- charts_subset %>% 
  filter(region %in% c(
    # North America
    "Canada", "United States", "Mexico",
    # South America (present in data)
    "Argentina", "Bolivia", "Brazil", "Chile",
    "Colombia", "Ecuador", "Paraguay", "Peru", "Uruguay"
  ))

write_csv(charts_north_and_south_america, "week8_alt/charts/charts_north_n_south_america_2021.csv")
