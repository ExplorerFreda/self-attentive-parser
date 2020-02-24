cd ..
mkdir models/debug/
python src/main.py train \
    --train-path data/02-21.10way.clean.$1p \
    --dev-path data/22.auto.clean.$1p \
    --model-path-base models/debug/debug \
    --bert-model "bert-large-uncased" --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 \
    --use-bert --evalb-dir EVALB_SPMRL/ --use-extra-info --ignore-leaf
