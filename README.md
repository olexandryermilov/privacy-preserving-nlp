# privacy-preserving-nlp
Preprocessing folder contains scripts for pseudonymizing datasets. 
Training folder contains scripts for training models on pseudonymized datasets.
Run `install.sh` to install all the needed dependencies and libraries.
Before running each script, please check its arguments.
## Preprocessing
### preprocessing/gpt_preprocessing.py
<details>
<summary>Arguments: </summary>

| Argument | Argument description |
|----------------|----------------------|
|-t, -token|Token from openai platform|
|-i, -input|Input file|
|-o, -output|Where to save your output|

</details>

## Training
### training/train_seq2seq.sh
<details>
<summary>Arguments:</summary>

| Argument | Argument description |
|----------------|----------------------|
|-t|Path to test file|
|-i|Path to train file|
</details>

### training/classification.sh
Use it rather than the `training/transformers_classification.sh`, will split the training set for train and val automatically.
<details>
<summary>Arguments:</summary>

| Argument | Argument description |
|----------------|----------------------|
|-t|Path to test file|
|-i|Path to train file|
|-x|Name of the method, will be used in the path of output model|
|-r|ID of checkpoint to resume from, optional|
</details>

### training/classification_scores.py
Will calculate the scores for the classification task for you, please provide the path to the predictions file as the first argument.

For example, `python3 classification_scores.py /path/to/predictions.txt`

### training/transformers_summarization.sh
<details>
<summary>Arguments:</summary>

| Argument | Argument description |
|----------------|----------------------|
|-t|Path to test file|
|-i|Path to train file|
|-v|Path to validation file|
|-x|Name of the method, will be used in the path of output model|
|-r|ID of checkpoint to resume from, optional|
</details>
