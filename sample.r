library(tidyverse)

df <- read.csv("dados_SM.csv",sep=';',dec='.')
df$Data.Medicao <- lubridate::ymd(df$Data.Medicao)
df <- df %>% mutate_if(is.character,as.numeric)





df <- df %>% 
  mutate(month=lubridate::month(Data.Medicao),year=lubridate::year(Data.Medicao))
avg_year <- df %>%
  group_by(year) %>%
  summarise(temp_media = mean(media_temp_diaria,na.rm=TRUE),na.rm=TRUE)


view(avg_year)
