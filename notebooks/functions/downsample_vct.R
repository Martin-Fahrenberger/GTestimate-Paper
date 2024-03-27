downsample_vct <- function(vct, n, size){
  require(tidyverse)
  tmp_matrix <- matrix(0,nrow = length(vct), ncol = n)
  rownames(tmp_matrix) <- names(vct)
  for(i in 1:n){
    find_sample <- T
    while(find_sample){
      tmp <- tibble(gene = sample(names(vct), size = size, prob = vct, replace = T)) %>%
        group_by(gene) %>%
        summarize(count = n())
      if(length(unique(tmp$count)) > 2){
        # prevent edge case for which the final count vector only has one or two expression levels
        find_sample <- F
      }
    }
    tmp_matrix[tmp$gene, i] <- tmp$count
  }
  return(tmp_matrix)
}