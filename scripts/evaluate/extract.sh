#!/bin/sh 

cd ../../
for fn in $(ls -d models/$1/*/*.pt.log)
do
    tail -n 4832 $fn > $fn.cons
    java -cp ../../stanford-parser-full-2018-10-17/stanford-parser.jar \
        edu.stanford.nlp.trees.EnglishGrammaticalStructure \
        -treeFile $fn.cons -basic > $fn.dep
    python calc_acc.py -i $fn.dep -l 
done

for fn in $(ls -d models/$1/*/*.pt.log)
do
    python calc_acc.py -i $fn.dep 
done
