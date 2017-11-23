#!/bin/bash
tmpDir=$(mktemp -d /tmpDir/x1/tmp.XXXXXX)
chmod 777 $tmpDir
export _JAVA_OPTIONS=-Djava.io.tmpdir=$tmpDir
export TMPDIR=$tmpDir

(
cd /tmpDir/call-mapping/execution
python /image_software/pipeline-container/src/encode_map.py \
 /tmpDir/call-mapping/inputs/home/lifeisaboutfishtacos/Desktop/input_data/input_data/reference/GRCh38_chr21_bwa.tar.gz \
 native \
 /tmpDir/call-mapping/inputs/home/lifeisaboutfishtacos/Desktop/input_data/input_data/ENCFF000VOL_chr21.fq.gz
)

echo $? >  /tempDir/call-mapping/execution/rc.tmp

(

cd /tmpDir/x1
mkdir /tmpDir/x1/A
( ln -L *.sai /tmpDir/x1/A 2> /dev/null ) || ( ln *.sai  /tempDir/x1/A )
ls -1  /tempDir/x1/A >  /tempDir/x1/A.list

mkdir  /tempDir/x1/B
( ln -L *.gz  /tempDir/x1/B 2> /dev/null ) || ( ln *.gz  /tempDir/x1/B )
ls -1  /tempDir/x1/B >  /tempDir/x1/B.list

mkdir  /tempDir/x1/C
( ln -L mapping.log  /tempDir/x1/C 2> /dev/null ) || ( ln mapping.log  /tempDir/x1/C )
ls -1  /tempDir/x1/C >  /tempDir/x1/C.list

mkdir  /tempDir/x1/D
( ln -L mapping.json  /tempDir/x1/D 2> /dev/null ) || ( ln mapping.json  /tempDir/x1/D )
ls -1  /tempDir/x1/D >  /tempDir/x1/D.list

)
sync
mv  /tempDir/x1/rc.tmp  /tempDir/x1/rc