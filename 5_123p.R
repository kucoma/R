library(ggplot2)
library(dplyr)

midwest_new <- as.data.frame(ggplot2::midwest)

head(midwest_new)
summary(midwest_new)
str(midwest_new)


midwest_new <- rename(midwest_new, total = poptotal)
midwest_new <- rename(midwest_new, asian = popasian)
str(midwest_new)

midwest_new$totasian <- (midwest_new$asian / midwest_new$total) * 100
hist(midwest_new$totasian)
totasian_mean <- mean(midwest_new$totasian)
totasian_mean
midwest_new$mean <- ifelse(midwest_new$totasian > totasian_mean, "large", "small")
str(midwest_new$mean)
table(midwest_new$mean)
qplot(midwest_new$mean)
