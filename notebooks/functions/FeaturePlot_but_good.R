FeaturePlot_but_good <- function(seurat_object, features, slot = 'data', point_size = 0.5){
  require(tidyseurat)
  tmp_expr <- as_tibble(t(as.matrix(GetAssayData(object = seurat_object, slot = slot)[features, ]))) %>% cbind(cell = colnames(seurat_object))
  tmp_data <- as_tibble(seurat_object) %>% rename(cell = .cell) %>% left_join(tmp_expr) %>% pivot_longer(cols = features, names_to = 'gene', values_to = 'expr')
  ggplot(tmp_data) + geom_point(aes(x = umap_1, y = umap_2, col = expr), size = point_size) + scale_color_viridis() + facet_wrap(~gene)
}