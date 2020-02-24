#!/bin/sh 

# English: 4832
# Chinese: 3820 

cd ../../
for fn in $(ls -d models/$1/*/*.pt.log)
do
    tail -n $3 $fn > $fn.cons
    java -cp ../../stanford-parser-full-2018-10-17/stanford-parser.jar \
        edu.stanford.nlp.trees.$2GrammaticalStructure \
        -treeFile $fn.cons -basic > $fn.dep
    python scripts/evaluate/calc_acc.py -i $fn.dep -l 
done

for fn in $(ls -d models/$1/*/*.pt.log)
do
    python scripts/evaluate/calc_acc.py -i $fn.dep 
done
