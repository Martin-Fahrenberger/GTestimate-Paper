# GTestimate

This Repository contains all Code necessary to reproduce the findings of our paper "GTestimate: Improving relative gene expression estimation in scRNA-seq using the Good-Turing estimator"

## Overview

For a desription and reasoning of the analysis steps see the methods section of our paper.

### Raw reads
The .sh scripts in the parent directory are used for raw read processing and should probably be run on a server.
The raw read data can be accessed at: PLACEHOLDER and the paths need to be set manually in the various .sh scripts.

For processing of the raw reads you will need the CellRanger software (we used version 7.1.0) and samtools.

### Data Analysis
The data analysis for this project was done in R and starts from intermediate results.
These intermediate results can be accessed at: PLACEHOLDER and the paths need to be set manually in the various .Rmd scripts

The analysis was mostly done using tidyverse, Seurat as well as a collection of other packages.

All analysis scripts are contained in the notebooks/ directory, including a run_analysis.R script which calls the individual .Rmd scripts in order.

All necessary packages are listed in notebooks/renv.lock and can be installed using renv::restore().
