#!/bin/sh
#########################################

#Change these variables to match what is needed in your project:

Genome="/home/mirae/data/Publication_Raw_Data_Processing/bowtie_indices/ecoli_with_mtcs" #"," Seperated list of bowtie indexes to align to.
Raw_Data_Location="/home/mirae/data/Sequencing/210809Li/raw_reads/" #Folder where the raw data lives.
Save_Folder_Location="/home/mirae/data/Sequencing/210809Li/" #Folder for where to store all intermediary files.
Trimming=false #Whether or not to trim from the end of the sequence (eg if there is a known seq that can be read into).
Trim_Seq="A" #The sequence to trim if found. 
Bowtie_Args="-k 1 -v 2"

#If using CDS files to make dataframe, list all CDS files and corresponding genome names in correct order here:

CDS_Dir="/home/mirae/data/Publication_Raw_Data_Processing/cds_files/"
CDS_Files="capsule_CDS.txt,E_coli_CDS.txt"
CDS_Genomes="pMP026_flip_lacI_kan_original_min_35,NC_000913.2"
CDS_Names="capsule,ecoli"

########################################

Trim_Save=${Save_Folder_Location}raw_reads/
Trim_End="_trimmed.fastq"
Sorted_Save=${Save_Folder_Location}aligned_and_sorted_files/
Sorted_End="_${Genome##*/}_sorted.bam"
Depth_Save=${Save_Folder_Location}depth_files/
Wig_Save=${Save_Folder_Location}wig_files/
DataFrame_Save=${Save_Folder_Location}dataframe_files/

#######################################

check_make_dir() {
	if [ ! -d "$1" ]; then
		echo "Making Directory $1"
		mkdir $1
	fi
}

check_make_dir "$Trim_Save"
check_make_dir "$Sorted_Save"
check_make_dir "$Depth_Save"
check_make_dir "$Wig_Save"
check_make_dir "$DataFrame_Save"