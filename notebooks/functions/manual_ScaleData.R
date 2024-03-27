manual_ScaleData <- function(seurat_object, gene_means, gene_sds){
  require(Seurat)
  tmp_data <- as.matrix(GetAssayData(seurat_object, slot = 'data'))
  tmp_data <- (tmp_data - gene_means)/gene_sds
  tmp_data <- replace(tmp_data, tmp_data > 10, 10)
  return(SetAssayData(seurat_object, slot = 'scale.data', new.data = tmp_data))
}