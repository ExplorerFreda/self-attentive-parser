cd ../..
mkdir models/const_only/en_bert-$1p-$3l-$4d/
python src/main.py train \
    --train-path data/02-21.10way.clean.$1p \
    --dev-path data/22.auto.clean.$1p \
    --model-path-base models/const_only/en_bert-$1p-$3l-$4d/model-$2-pa$5 \
    --bert-model "bert-large-uncased" --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/ --num-layers $3 --d-model $4 --step-decay-patience $5 --use-extra-info --use-test-only
