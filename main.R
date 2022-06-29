library(tercen)
library(dplyr)
library(dtplyr)

ctx <- tercenCtx()

df_out<- ctx %>% 
  select(.y, .ci, .ri) %>% 
  lazy_dt() %>%
  group_by(.ci, .ri) %>%
  summarise(sum = sum(.y)) %>%
  as_tibble() %>%
  ctx$addNamespace()

df_out %>%
  ctx$save()
