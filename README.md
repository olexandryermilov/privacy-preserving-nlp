Official implementation of the paper "Privacy- and Utility-Preserving NLP with Anonymized data: A case study of Pseudonymization", accepted for publication at TrustNLP Workshop at ACL 2023. 

https://aclanthology.org/2023.trustnlp-1.20/


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

Preprocessing scripts for placeholder preprocessing, wikidata preprocessing and Seq2Seq preprocessing are in respective Jupyter notebooks.

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


# Citation
```
@inproceedings{yermilov-etal-2023-privacy,
    title = "Privacy- and Utility-Preserving {NLP} with Anonymized data: A case study of Pseudonymization",
    author = "Yermilov, Oleksandr  and
      Raheja, Vipul  and
      Chernodub, Artem",
    booktitle = "Proceedings of the 3rd Workshop on Trustworthy Natural Language Processing (TrustNLP 2023)",
    month = jul,
    year = "2023",
    address = "Toronto, Canada",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2023.trustnlp-1.20",
    doi = "10.18653/v1/2023.trustnlp-1.20",
    pages = "232--241",
    abstract = "This work investigates the effectiveness of different pseudonymization techniques, ranging from rule-based substitutions to using pre-trained Large Language Models (LLMs), on a variety of datasets and models used for two widely used NLP tasks: text classification and summarization. Our work provides crucial insights into the gaps between original and anonymized data (focusing on the pseudonymization technique) and model quality and fosters future research into higher-quality anonymization techniques better to balance the trade-offs between data protection and utility preservation. We make our code, pseudonymized datasets, and downstream models publicly available.",
}
```
