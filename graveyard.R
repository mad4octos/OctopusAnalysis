

#####Packages#####
library(ggplot2)
library("dplyr")                           # Install dplyr package
library("plyr")                            # Install plyr package
library("readr")  
library(stringr)


#my durations are truncated at 30 min! 


#all <- list.files(path = "data/",    
              #         pattern = "*.csv", full.names = TRUE) %>%
 # lapply(read_csv) %>%  
 # bind_rows

haliai_act <- read_csv("data/haliai_act.csv")
haliai_act_bot <- read_csv("data/haliai_act_bot.csv")
haliai_post_bot <- read_csv("data/haliai_post_bot.csv")
haliai_post <- read_csv("data/haliai_post.csv")
haliai_pre_bot <- read_csv("data/haliai_pre_bot.csv")
haliai_pre <- read_csv("data/haliai_pre.csv")
loki_act_bot <- read_csv("data/loki_act_bot.csv")
loki_act <- read_csv("data/loki_act.csv")
loki_post_bot <- read_csv("data/loki_post_bot.csv")
loki_post <- read_csv("data/loki_post.csv")
ragnar_act_bot <- read_csv("data/ragnar_act_bot.csv")
ragnar_act <- read_csv("data/ragnar_act.csv")
ragnar_post_bot <- read_csv("data/ragnar_post_bot.csv")
ragnar_post <- read_csv("data/ragnar_post.csv")
ragnar_pre_bot <- read_csv("data/ragnar_pre_bot.csv")
ragnar_pre <- read_csv("data/ragnar_pre.csv")

all <- bind_rows(haliai_act, haliai_post, haliai_pre,ragnar_post, ragnar_act,
                 ragnar_pre, loki_post, loki_act)

all[c("ind", "obs")] <- str_split_fixed(all$`Observation id`, " ", 2)

bot <- bind_rows(haliai_act_bot, haliai_post_bot, haliai_pre_bot, loki_act_bot,
                 loki_post_bot, ragnar_pre_bot, ragnar_post_bot, ragnar_act_bot)

bot[c("ind", "obs")] <- str_split_fixed(bot$`Observation id`, " ", 2)

#all[c('m1', 'm2')] <- str_split_fixed(all$Modifiers, '|',2)  
#Why isn't this one working? find and replace in excel


write.csv(bot, "data/bot.csv")
write.csv(all, "data/all.csv")
#find and replace "|" with "-" in excel for both data sheets

mutate(se = sd / sqrt(count),
       lower_ci = lower_ci(mean, se, count),
       upper_ci = upper_ci(mean, se, count)) 
