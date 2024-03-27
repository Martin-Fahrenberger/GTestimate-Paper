#!/bin/bash

# This script runs cell ranger on the raw-reads from our cta-seq run 2.
# CellRanger requires quite some compute power and this script should probably be executed on a server.

export PATH=/project/martinf/cta_seq/cellranger-7.1.0:$PATH

SAMPLE_LIST=229150_AAGAGGCATCGACTAG,229150_ACTCGCTACTATTAAG,229150_AGGCAGAATATCCTCT,229150_ATCTCAGGGCGTAAGA,229150_CAGAGAGGCTAAGCCT,229150_CGAGGCTGTCTCTCCG,229150_CGGAGCCTTTATGCGA,229150_CGTACTAGCTCTCTAT,229150_CTCTCTACAAGGAGTA,229150_GCGTAGTAGAGCCTTA,229150_GCTACGCTCGTCTAAT,229150_GCTCATGACCTAGAGT,229150_GGACTCCTGTAAGGAG,229150_GGAGCTACAAGGCTAT,229150_GTAGAGGATTCTAGCT,229150_TAAGGCGATAGATCGC,229150_TAGGCATGACTGCATA,229150_TCCTGAGCAGAGTAGA

cellranger count --id=cta_seq_run2 \
                 --transcriptome=/project/martinf/cta_seq/refdata-gex-GRCh38-2020-A \
                 --fastqs=/project/martinf/cta_seq/HTTCYDSX5_4_R15296_20230423/demultiplexed/229150/ \
                 --sample=$SAMPLE_LIST \
                 --localcores=48 \
                 --localmem=500
