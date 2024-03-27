#!/bin/bash

# This script runs cell ranger on the raw-reads from our cta-seq run 1.
# CellRanger requires quite some compute power and this script should probably be executed on a server.

export PATH=/project/martinf/cta_seq/cellranger-7.1.0:$PATH

cellranger count --id=cta_seq \
                 --transcriptome=/project/martinf/cta_seq/refdata-gex-GRCh38-2020-A \
                 --fastqs=/project/martinf/cta_seq/H335LDSX5_4_R14586_20221207/demultiplexed/210905/ \
                 --sample=210905 \
                 --localcores=48 \
                 --localmem=500
