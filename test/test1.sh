#!/bin/sh

export PYTHONPATH=/dataset/bioinformatics_dev/active/tardis/tardis
export PATH="/dataset/bioinformatics_dev/active/tardis/tardis:$PATH"

BWA_REF=/dataset/bioinformatics_dev/active/tardis/tardis/test/mRNAs.fa
DATADIR=/dataset/bioinformatics_dev/active/tardis/tardis/test
BWA_REF=mRNAs.fa 


rm -f results.out.gz R1R2_vs_mRNAs.bam /home/mccullocha/hello_from_slurm.txt

#/usr/local/agr-scripts/tardis.py -w -d .  -hpctype local ls      # current version on system 
#tardis.py -w -q -d .  -hpctype local ls      # new version  
#tardis.py -w -d . -c 2  -hpctype local blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out       
#tardis.py -w -d . -c 2  -hpctype local blastn -query _condition_fastq2fasta_input_test.fastq -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out       

#tardis.py -dryrun -hpctype slurm  echo hello world \> /home/mccullocha/hello_from_slurm.txt       
#tardis.py -dryrun  -c 2  -hpctype slurm blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out 
#tardis.py -dryrun -shell-include-file test_include.txt  -c 2  -hpctype slurm blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out 
#tardis.py -c 2  -hpctype slurm blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out 
#tardis.py -shell-include-file test_include.txt  -c 2  -hpctype slurm blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out 
#tardis.py -shell-include-file test_include.txt -job-file array_job1.txt  -c 2  -hpctype slurm blastn -query _condition_fasta_input_test.fa -db /dataset/blastdata/active/mirror/rat.fna -out _condition_text_output_results.out 


tardis.py -w -c 5  -hpctype slurm bwa aln $DATADIR/$BWA_REF _condition_paired_fastq_input_$DATADIR/R1.fastq \> _condition_throughput_R1_v_$BWA_REF.sai \;  bwa aln $DATADIR/$BWA_REF _condition_paired_fastq_input_$DATADIR/R2.fastq \> _condition_throughput_R2_v_$BWA_REF.sai \; bwa sampe $DATADIR/$BWA_REF _condition_throughput_R1_v_$BWA_REF.sai _condition_throughput_R2_v_$BWA_REF.sai _condition_paired_fastq_input_$DATADIR/R1.fastq _condition_paired_fastq_input_$DATADIR/R2.fastq \> _condition_sam_output_R1R2_vs_mRNAs.bam

