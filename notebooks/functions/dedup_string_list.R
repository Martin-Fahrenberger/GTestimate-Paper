require(tidyverse)
dedup_string_list <- function(string_list){
  tmp_tbl <- tibble(text = string_list) %>%
    group_by(text) %>%
    mutate(occurence = (1:n())-1) %>%
    mutate(occurence = as.character(occurence)) %>%
    mutate(text = paste(text, occurence, sep = '.')) %>%
    mutate(text = str_replace(text, pattern = '\\.0', replacement = ''))
  return(tmp_tbl$text)
}
