binned_dists <- function(dist_object, ncount_list, name) {
  require(tidyverse)
  dist_mat <- dist_object %>% as.matrix()
  dist_mat <- replace(dist_mat, lower.tri(dist_mat), 0)
  
  dist_tbl <- dist_mat %>%
    as.data.frame() %>%
    rownames_to_column(var = 'Cell_A') %>%
    as_tibble %>%
    pivot_longer(cols = !Cell_A, names_to = 'Cell_B', values_to = 'Distance') %>%
    filter(Distance != 0)
  
  read_count_tbl_A <- tibble(Cell_A = names(ncount_list), nCount_A = ncount_list)
  read_count_tbl_B <- tibble(Cell_B = names(ncount_list), nCount_B = ncount_list)
  
  lower_third <- read_count_tbl_A$nCount_A %>% quantile(probs = c(1/3))
  upper_third <- read_count_tbl_A$nCount_A %>% quantile(probs = c(2/3))
  
  dist_tbl <- dist_tbl %>%
    left_join(read_count_tbl_A) %>%
    left_join(read_count_tbl_B)
  
  dist_tbl <- dist_tbl %>%
    mutate(size_bin = 'mixed') %>%
    mutate(size_bin = replace(size_bin, nCount_A < lower_third & nCount_B < lower_third, 'small')) %>%
    mutate(size_bin = replace(size_bin, nCount_A > upper_third & nCount_B > upper_third, 'big')) %>%
    mutate(size_bin = replace(size_bin, nCount_A > lower_third &
                                nCount_B > lower_third &
                                nCount_A < upper_third &
                                nCount_B < upper_third, 'medium'))
  
  dists_plot <- ggplot(dist_tbl %>% filter(size_bin != 'mixed')) +
    geom_boxplot(aes(y = Distance, col = size_bin))
  
  ggsave(str_glue('{folder}{name}_dists_plot.pdf'), dists_plot, width = 6.6, height = 4)
  saveRDS(file = str_glue('{folder}{name}_dists_plot.Rds'), dists_plot)
}