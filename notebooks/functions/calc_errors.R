calc_errors <- function(typical_seurat, deep_seurat, cell, metric = 'absolute'){
  require(Seurat)
  ground_truth <- GetAssayData(deep_seurat, assay = 'RNA', slot = 'data')[,cell]
  ml_estimate <- GetAssayData(typical_seurat, assay = 'RNA', slot = 'data')[,cell]
  gt_estimate <- GetAssayData(typical_seurat, assay = 'GTestimate', slot = 'data')[,cell]
  if(metric == 'squared'){
    tmp_error_ml <- sum((ground_truth - ml_estimate)**2)
    tmp_error_gt <- sum((ground_truth - gt_estimate)**2)
  } else if(metric == 'absolute'){
    tmp_error_ml <- sum(abs(ground_truth - ml_estimate))
    tmp_error_gt <- sum(abs(ground_truth - gt_estimate))
  } else {
    abort('Selected distance method unknown')
  }
  return(list(metric = metric, ML = tmp_error_ml, GT = tmp_error_gt, cell = cell))
}
