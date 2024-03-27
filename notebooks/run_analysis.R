# This R-Script exectues all analysis scripts in the correct order.
# It assumes that the raw cta_seq data has already been processed using the two scripts run_cellranger.sh and run_cellranger_2.sh
# or that the processed data has been downloaded and stored in the cta_seq and cta_seq_run2 folders.
# rendering the .Rmd scripts will produce .html reports and may also create other files and folders with additional information.
# Finally pub_figures.Rmd will produce all figures as found in the publication.
# These scripts dont require much computation and should be able to run on a modern laptop in reasonable time.
# The shell scripts in the parent directory are a different story, and should probably be run on a server.

library(rmarkdown)
render('read_counts_overview.Rmd')
render('select_cells.Rmd')
render('umi_correction.Rmd')
render('downsampling_results.Rmd')
render('cta_seq_results.Rmd')
render('downstream_analysis_results.Rmd')
render('spatial_transcriptomics_results.Rmd')
render('toy_example.Rmd')

render('pub_figures.Rmd')


