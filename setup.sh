#!/bin/bash

$HADOOP_HOME/sbin/start-all.sh

hdfs dfs -rm -r -f /SkeinAssignment

hdfs dfs -mkdir /SkeinAssignment
hdfs dfs -mkdir /SkeinAssignment/input 
hdfs dfs -put dataset/* /SkeinAssignment/input

javac -cp `hadoop classpath` -d ./convertToSequence/ ./convertToSequence/*.java

jar cfm ConvertSequence.jar ./convertToSequence/Manifest.txt ./convertToSequence/convertsequence/*.class

echo "done compile !"

javac -cp `hadoop classpath` -d ./detectDuplicateImage ./detectDuplicateImage/*.java

jar cfm DetectDuplicate.jar ./detectDuplicateImage/Manifest.txt ./detectDuplicateImage/detectduplicate/*.class

echo "done compile !"