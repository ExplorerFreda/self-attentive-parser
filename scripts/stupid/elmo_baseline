cd ../..
mkdir models/stupid/en_elmo-$1ex-$3l-$4d/
python src/main.py train \
    --train-path data/02-21.10way.clean.$1l.replace \
    --dev-path data/22.auto.clean.5l.replace \
    --model-path-base models/stupid/en_elmo-$1ex-$3l-$4d/model-$2-pa$5 \
    --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-elmo --evalb-dir EVALB_SPMRL/ --num-layers $3 --d-model $4 --step-decay-patience $5
