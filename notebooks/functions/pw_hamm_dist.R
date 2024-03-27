pw_hamm_dist <- function(umi_list){
  return(sapply(umi_list, function(x) sapply(umi_list, function(y) hamm_dist(x,y))))
}