#$1: en_bert en_bert_only

cd ../../
for fn in $(ls -d models/$1/*/*.pt)
do
    if [ -f $fn.log ] 
    then 
        continue
    else
        echo $fn
        python src/main.py test \
            --model-path-base $fn > $fn.log
    fi
done
