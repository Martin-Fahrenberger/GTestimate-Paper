# This script summarizes the raw read data and extracts the neccesary information for our custom UMI-correction
# Since this script is handling raw-read data it should probably be executed on a server

# This requires the raw .bam files for our experiments which are not part of this repoitory.
samtools flagstat cta_seq/outs/possorted_genome_bam.bam > data/normal_summary.txt
samtools flagstat cta_seq_run2/outs/possorted_genome_bam.bam > data/deep_summary.txt

# there are 428748923 lines in the possorted_bam
samtools view cta_seq_run2/outs/possorted_genome_bam.bam | awk '{for (i=1; i<=NF; i++) {if ($i ~ /^CB:Z:/) {printf $i "\n"}}}' | sort | uniq -c | sort -rn > data/deep_cbz_sorted.txt
samtools view cta_seq/outs/possorted_genome_bam.bam | awk '{for (i=1; i<=NF; i++) {if ($i ~ /^CB:Z:/) {printf $i "\n"}}}' | sort | uniq -c | sort -rn > data/normal_cbz_sorted.txt

samtools view cta_seq_run2/outs/possorted_genome_bam.bam | grep 'xf:i:25\|xf:i:17' | grep -E 'GN:Z:.*CB:Z:.*UR:Z:.*UB:Z:' | awk '{for (i=1; i<=NF; i++) {if ($i ~ /^GN:Z:/) {printf "\t" $i "\t"}; if ($i ~ /^CB:Z:/) {printf $i "\t"}; if ($i ~ /^UR:Z:/) {printf $i "\t"}; if ($i ~ /^UB:Z:/) {printf $i "\n"}}}'  > data/deep_read_ids_xf_25_17_UR.txt
sort data/deep_read_ids_xf_25_17_UR.txt | uniq -c > data/deep_read_ids_xf_25_17_UR_counted.txt
sort data/deep_read_ids_xf_25_17_UR_counted.txt | sort -rn > data/deep_read_ids_xf_25_17_UR_counted_sorted.txt

samtools view cta_seq_run2/outs/possorted_genome_bam.bam | grep 'xf:i:25\|xf:i:17' | grep -E 'GX:Z:.*CB:Z:.*UR:Z:.*UB:Z:' | awk '{for (i=1; i<=NF; i++) {if ($i ~ /^GX:Z:/) {printf "\t" $i "\t"}; if ($i ~ /^CB:Z:/) {printf $i "\t"}; if ($i ~ /^UR:Z:/) {printf $i "\t"}; if ($i ~ /^UB:Z:/) {printf $i "\n"}}}'  > data/deep_read_ids_xf_25_17_UR_GX.txt
sort data/deep_read_ids_xf_25_17_UR_GX.txt | uniq -c > data/deep_read_ids_xf_25_17_UR_GX_counted.txt
sort data/deep_read_ids_xf_25_17_UR_GX_counted.txt | sort -rn > data/deep_read_ids_xf_25_17_UR_GX_counted_sorted.txt


