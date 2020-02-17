#$1: en_bert en_bert_only

cd ../../
for fn in $(ls -d models/$1/*/*.pt)
do
    if [ -f $fn.log ]
    then
        rm $fn.log
    fi
    if [ -f $fn.log ] 
    then 
        continue
    else
        echo $fn
        python src/main.py test --test-path ./data/chinese_test.txt \
            --model-path-base $fn > $fn.log
    fi
done
