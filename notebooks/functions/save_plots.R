save_plots <- function(plot, file_name, folder_name = '', type = '.png', width = 6.6, height = 4){
  require(ggplot2)
  dir.create(folder_name, showWarnings = F)
  ggsave(paste0(folder_name, '/', file_name, type), plot, width = width, height = height)
}