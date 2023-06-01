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
if [ ! -z "$checkpoint" ]
then
  python3 transformers/examples/pytorch/summarization/run_summarization.py \
    --model_name_or_path facebook/bart-base \
    --do_train \
    --do_eval \
    --do_predict \
    --train_file ${train} \
    --validation_file ${val} \
    --test_file ${test} \
    --output_dir "./summarization_${method}_$(date +"%T")" \
    --per_device_train_batch_size=8 \
    --per_device_eval_batch_size=8 \
    --predict_with_generate \
    --text_column source \
    --summary_column target \
    --save_steps 25000 \
    --resume_from_checkpoint "${checkpoint}"
else
  python3 transformers/examples/pytorch/summarization/run_summarization.py \
    --model_name_or_path facebook/bart-base \
    --do_train \
    --do_eval \
    --do_predict \
    --train_file ${train} \
    --validation_file ${val} \
    --test_file ${test} \
    --output_dir "./summarization_${method}_$(date +"%T")" \
    --per_device_train_batch_size=8 \
    --per_device_eval_batch_size=8 \
    --predict_with_generate \
    --text_column source \
    --summary_column target \
    --save_steps 25000
fi