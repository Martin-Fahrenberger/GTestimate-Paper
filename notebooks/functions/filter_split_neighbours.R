filter_split_neighbours <- function(neighbourhood_scores){
  tmp_clusters <- neighbourhood_scores$seurat_clusters
  names(tmp_clusters) <- neighbourhood_scores$.cell
  
  filtered_data <- neighbourhood_scores %>% group_by(.cell) %>% filter(length(unique(tmp_clusters[current_neighbours]))==1)
  
  return(filtered_data)
}