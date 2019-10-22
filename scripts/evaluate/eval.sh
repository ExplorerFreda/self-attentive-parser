#$1: en_bert en_bert_only

cd ../../
for f in $(ls models/$1_corrdev/$1-$2p/)
do
    echo $2 $f
    python src/main.py test --model-path-base models/$1_corrdev/$1-$2p/$f > models/$1_corrdev/$1-$2p/$f.log
done