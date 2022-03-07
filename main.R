library(tercen)
library(dplyr)

ctx <- tercenCtx()

ctx %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(sum = sum(.y)) %>%
  ctx$addNamespace() %>%
  ctx$save()
