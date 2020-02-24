# baseline no augmentation
cd ../..
mkdir models/icelandic/baseline_mling_bert-$1ex-$3l-$4d/
python src/main.py train \
    --train-path data/icelandic_train.txt.$1l \
    --dev-path data/icelandic_dev.txt.5l \
    --model-path-base models/icelandic/baseline_mling_bert-$1ex-$3l-$4d/model-$2-pa$5 \
    --bert-model bert-base-multilingual-uncased --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/ --num-layers $3 --d-model $4 --step-decay-patience $5
