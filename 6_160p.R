library(dplyr)
library(ggplot2)


midwest <- as.data.frame(ggplot2::midwest)

data <- midwest %>% 
  mutate(tot = (poptotal-popadults)/poptotal*100) %>% 
  arrange(desc(tot))

data %>% arrange(desc(tot)) %>% 
  select(tot, county)

head(data, 5)


data <- data %>% mutate(level = ifelse(data$tot >= 40 , "large", 
                                       ifelse(data$tot >= 30, "middle", "small")))
table(data$level)
qplot(data$level)

midwest <- as.data.frame(ggplot2::midwest)
data1 <- midwest %>%
  mutate(tot_asian = (popasian/poptotal)*100) %>%
  arrange(tot_asian) %>%
  select(state, county, tot_asian) %>%
  head(10)
data1