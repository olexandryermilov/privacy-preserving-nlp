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
python3 classification.py ${train}
if [ ! -z "$checkpoint"]
then
  bash transformers_classification.sh -i "idmb_selected_train.csv" -v "idmb_selected_validation.csv" -t ${test} -r ${checkpoint} -x ${method}
else
  bash transformers_classification.sh -i "idmb_selected_train.csv" -v "idmb_selected_validation.csv" -t ${test} -x ${method}
fi