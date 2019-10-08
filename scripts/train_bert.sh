cd ..
python src/main.py train --use-bert --model-path-base models/en_bert --bert-model "bert-large-uncased" --num-layers 2 \
    --learning-rate 0.00005 --batch-size 32 --eval-batch-size 16 --subbatch-max-tokens 500 --evalb-dir EVALB_SPMRL/ 

