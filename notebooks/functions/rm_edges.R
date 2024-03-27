rm_edges <- function(my_graph){
  require(igraph)
  tmp_edges <- E(my_graph)
  if(length(tmp_edges)==0) {
    return(my_graph)
  } else {
    tmp_counts <- V(my_graph)$count
    names(tmp_counts) <- names(V(my_graph))
    edges_to_remove <- c()
    for(i in 1:length(tmp_edges)){
      tmp_vertices <- V(my_graph)[.inc(i)]
      tmp_pair <- tmp_counts[tmp_vertices]
      if (tmp_pair[1] < (2*tmp_pair[2] - 1)) {
        edges_to_remove <- append(edges_to_remove, i)
      }
    }
    my_graph <- delete_edges(my_graph, edges_to_remove)
    return(my_graph)
  }
}