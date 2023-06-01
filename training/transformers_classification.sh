while getopts i:v:t:r:x: flag
do
    case "${flag}" in
        i) train=${OPTARG};;
        v) val=${OPTARG};;
        t) test=${OPTARG};;
        r) checkpoint=${OPTARG};;
        x) method=${OPTARG};;
    esac
done
if [ ! -z "$checkpoint"]
then
  python3 transformers/examples/pytorch/text-classification/run_glue.py \
    --model_name_or_path bert-base-cased \
    --do_train \
    --do_predict \
    --train_file ${train} \
    --validation_file ${val} \
    --test_file ${test} \
    --output_dir "./classification_${method}_$(date +"%T")" \
    --per_device_train_batch_size=8 \
    --per_device_eval_batch_size=8 \
    --save_steps 5000 \
    --max_seq_length 128 \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --resume_from_checkpoint "${checkpoint}"
else
  python3 transformers/examples/pytorch/text-classification/run_glue.py \
    --model_name_or_path bert-base-cased \
    --do_train \
    --do_predict \
    --train_file ${train} \
    --validation_file ${val} \
    --test_file ${test} \
    --output_dir "./classification_${method}_$(date +"%T")" \
    --per_device_train_batch_size=8 \
    --per_device_eval_batch_size=8 \
    --save_steps 5000 \
    --max_seq_length 128 \
    --learning_rate 2e-5 \
    --num_train_epochs 3
fi