pw_adjacency <- function(umi_tbl){
  umi_list <- umi_tbl$umi
  tmp_hamm_dists <- sapply(umi_list, function(x) sapply(umi_list, function(y) hamm_dist(x,y)))
  tmp_adjacencey_matrix <- replace(tmp_hamm_dists, tmp_hamm_dists !=1, 0)
  tmp_adjacencey_matrix <- replace(tmp_adjacencey_matrix, lower.tri(tmp_adjacencey_matrix) == TRUE,0)
  return(tmp_adjacencey_matrix)
}