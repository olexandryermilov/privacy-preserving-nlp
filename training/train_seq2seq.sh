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
python3 run_translation.py \
    --model_name_or_path facebook/bart-base \
    --do_train \
    --do_predict \
    --source_lang en \
    --target_lang de \
    --train_file ${train} \
    --test_file ${test} \
    --output_dir "./seq2seq_flair_$(date +"%T")" \
    --per_device_train_batch_size=16 \
    --per_device_eval_batch_size=16 \
    --predict_with_generate \
    --save_steps 25000
