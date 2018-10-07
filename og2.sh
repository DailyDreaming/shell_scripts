#!/bin/bash

cd /cromwell_root
tmpDir=`mkdir -p "/cromwell_root/tmp.43725cb9" && echo "/cromwell_root/tmp.43725cb9"`
chmod 777 "$tmpDir"
export _JAVA_OPTIONS=-Djava.io.tmpdir="$tmpDir"
export TMPDIR="$tmpDir"
export HOME="$HOME"
(
cd /cromwell_root

)
(
cd /cromwell_root


# Set the exit code of a pipeline to that of the rightmost command
# to exit with a non-zero status, or zero if all commands of the pipeline exit 
set -o pipefail
# cause a bash script to exit immediately when a command fails
set -e
# cause the bash shell to treat unset variables as an error and exit immediately
set -u
# echo each line of the script to stdout so we can see what is happening
set -o xtrace
#to turn off echo do 'set +o xtrace'

echo "Running pre-alignment"

samtools view -T /cromwell_root/topmed_workflow_testing/topmed_variant_caller/reference_files/hg38/hs38DH.fa -uh -F 0x900 /cromwell_root/topmed_workflow_testing/topmed_aligner/input_files/NWD176325.0005.recab.cram \
  | bam-ext-mem-sort-manager squeeze --in -.ubam --keepDups --rmTags AS:i,BD:Z,BI:Z,XS:i,MC:Z,MD:Z,NM:i,MQ:i --out -.ubam \
  | samtools sort -l 1 -@ 1 -n -T pre_output_base.samtools_sort_tmp - \
  | samtools fixmate - - \
  | bam-ext-mem-sort-manager bam2fastq --in -.bam --outBase pre_output_base --maxRecordLimitPerFq 20000000 --sortByReadNameOnTheFly --readname --gzip
)  > '/cromwell_root/stdout' 2> '/cromwell_root/stderr'
echo $? > /cromwell_root/rc.tmp
(
# add a .file in every empty directory to facilitate directory delocalization on the cloud
cd /cromwell_root
find . -type d -empty -print | xargs -I % touch %/.file
)
(
cd /cromwell_root
sync
# make the directory which will keep the matching files
mkdir /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e

# create the glob control file that will allow for the globbing to succeed even if there is 0 match
echo "This file is used by Cromwell to allow for globs that would not match any file.
By its presence it works around the limitation of some backends that do not allow empty globs.
Regardless of the outcome of the glob, this file will not be part of the final list of globbed files." > /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e/cromwell_glob_control_file

# symlink all the files into the glob directory
( ln -L pre_output_base.* /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e 2> /dev/null ) || ( ln pre_output_base.* /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e )

# list all the files (except the control file) that match the glob into a file called glob-[md5 of glob].list
ls -1 /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e | grep -v cromwell_glob_control_file > /cromwell_root/glob-7cc51463fe16c850aa9228b0db87877e.list


)
mv /cromwell_root/rc.tmp /cromwell_root/rc
