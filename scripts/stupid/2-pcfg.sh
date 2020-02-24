cd ../..
mkdir models/stupid/2_pcfg-en_bert-$1ex-$3l-$4d/
python src/main.py train \
    --train-path data/02-21.10way.clean.$1l.2-pcfg \
    --dev-path data/22.auto.clean.5l.2-pcfg \
    --model-path-base models/stupid/2_pcfg-en_bert-$1ex-$3l-$4d/model-$2-pa$5 \
    --bert-model "bert-large-uncased" --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/ --num-layers $3 --d-model $4 --step-decay-patience $5
