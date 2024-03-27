add_counts_to_vertices <- function(my_graph, my_tbl){
  require(igraph)
  V(my_graph)$count <- my_tbl$count
  return(my_graph)
}
