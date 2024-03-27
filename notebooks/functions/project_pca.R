project_pca <- function(pca, seurat_object){
  require(Seurat)
  tmp_pca <- pca
  tmp_pca@cell.embeddings <- t(as.matrix(GetAssayData(seurat_object, slot = 'scale.data')[rownames(pca@feature.loadings),])) %*% pca@feature.loadings
  tmp_pca@assay.used <- DefaultAssay(seurat_object)
  seurat_object@reductions$pca <- tmp_pca
  return(seurat_object)
}

