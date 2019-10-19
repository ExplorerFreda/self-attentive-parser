cd ../..
mkdir models/en_bert/en_bert-$1p/
python src/main.py train \
    --train-path data/02-21.10way.clean.$1p \
    --model-path-base models/en_bert/en_bert-$1p/model-$2 \
    --bert-model "bert-large-uncased" --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/
