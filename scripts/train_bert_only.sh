cd ..
for i in 1 2 3 4 5
do
    python src/main.py train --use-bert --model-path-base models/en_bert_only/model-$i --bert-model "bert-large-uncased" --num-layers 2 \
        --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 --use-bert-only
done
