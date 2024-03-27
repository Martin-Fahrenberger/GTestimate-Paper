calc_dist_sum <- function(neighbourhood_scores, dist_mode = 'dist'){
  require(tidyverse)
  n_count_ranks_temp <- neighbourhood_scores$nCount_Rank
  names(n_count_ranks_temp) <- neighbourhood_scores$.cell
  cf_ranks_temp <- neighbourhood_scores$CF_Rank
  names(cf_ranks_temp) <- neighbourhood_scores$.cell
  if (dist_mode == 'dist'){
    new_scores <- neighbourhood_scores %>% mutate(sum_of_dists = sum(dist(cbind(n_count_ranks_temp[as.vector(current_neighbours)],
                                                                cf_ranks_temp[as.vector(current_neighbours)]))))
  } else if (dist_mode == 'triangle'){
    # Trick to calculate area of induced triangle
    new_scores <- neighbourhood_scores %>% mutate(sum_of_dists = 0.5*det(rbind(c(1,1,1),
                                                                                n_count_ranks_temp[as.vector(current_neighbours)],
                                                                                cf_ranks_temp[as.vector(current_neighbours)])))
  } else {
    abort('Please choose either dist or triangle as a dist_mode')
  }
  return(new_scores)
}