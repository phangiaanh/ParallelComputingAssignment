#!/bin/bash

$HADOOP_HOME/sbin/start-all.sh

hdfs dfsadmin -safemode leave

hdfs dfs -rm -r -f /SkeinAssignment

hdfs dfs -mkdir /SkeinAssignment
hdfs dfs -mkdir /SkeinAssignment/input 
hdfs dfs -put dataset/* /SkeinAssignment/input

javac -cp `hadoop classpath` -d ./convertToSequence/ ./convertToSequence/*.java

cd ./convertToSequence

jar cfm ./ConvertSequence.jar ./Manifest.txt ./convertsequence/*.class

cd ../

echo "done compiling ConvertSequence.jar!"

javac -cp `hadoop classpath` -d ./detectDuplicateImage ./detectDuplicateImage/*.java

cd ./detectDuplicateImage

jar cfm ./DetectDuplicate.jar ./Manifest.txt ./detectduplicate/*.class

echo "done compiling DetectDuplicate.jar!"