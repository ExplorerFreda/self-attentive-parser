cd ..
python src/main.py train --model-path-base models/en_benepar_raw/model-$1p-$2 --num-layers 2 \
    --train-path data/02-21.10way.clean.$1p --use-words --use-chars-lstm --d-char-emb 64 \
    --evalb-dir EVALB_SPMRL/ \
    --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500

