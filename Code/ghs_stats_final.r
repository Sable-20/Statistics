library(ggplot2)
library(ggstatsplot)

# load the data
dat <- read.csv("https://raw.githubusercontent.com/Sable-20/Statistics/main/data/concatenated_data.csv")

# create a contingency table
table <- table(dat$brand, dat$turn_signal)
table #prints contingency table [type=Table] if needed can be used as `as.data.frame(rbind(table))` so that it can be used in ggstatsplot functions 

# perform a fisher's exact test
test <- fisher.test(table)

# graph the data onto a bar plot
ggbarstats(
    data=data.frame(rbind(dat)),
    x=turn_signal,
    y=brand,
    results.subtitle=FALSE,
    subtitle=paste0("Fisher's Exact Test", ", p-value ",
        ifelse(test$p.value < 0.001, "<0.001", round(test$p.value, 3))
    )
)