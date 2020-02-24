# baseline no augmentation
cd ../..
mkdir models/chinese/2_pcfg-mling_bert-$1ex-$3l-$4d/
python src/main.py train \
    --train-path data/chinese_train.txt.$1l.2-pcfg \
    --dev-path data/chinese_dev.txt.5l.2-pcfg \
    --model-path-base models/chinese/2_pcfg-mling_bert-$1ex-$3l-$4d/model-$2-pa$5 \
    --bert-model bert-base-multilingual-uncased --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/ --num-layers $3 --d-model $4 --step-decay-patience $5
