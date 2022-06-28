library(tercen)
library(dplyr)
library(dtplyr)

#library(tim)
#options("tercen.workflowId" = "78e8fce3c8d25341e1a5ee610e00571f")
#options("tercen.stepId"     = "3acc3418-c743-418d-8274-fcf2ae66dae2")

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

#build_test_data(df_out, ctx, test_name = "test1", test_folder = "./tests")

