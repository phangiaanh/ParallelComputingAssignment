
#!/bin/bash
mkdir ~/Assignment
mkdir ~/Assignment/result

hadoop jar ./convertToSequence/ConvertSequence.jar /SkeinAssignment/input/ /SkeinAssignment/seq/

hdfs dfs -rm /SkeinAssignment/seq/_SUCCESS 

hadoop jar ./detectDuplicateImage/DetectDuplicate.jar /SkeinAssignment/seq /SkeinAssignment/output

hdfs dfs -copyToLocal /SkeinAssignment/output/ ~/Assignment/result/
