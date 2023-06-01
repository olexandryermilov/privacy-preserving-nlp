from datasets import load_dataset
import sklearn.metrics
import sys

target = load_dataset("imdb")

with open(sys.argv[1], "r") as f:
    predictions = f.readlines()[1:]
    res_orig = []
    for prediction in predictions:
        res_orig.append(int(prediction.split("\t")[1][0]))
    print(sklearn.metrics.f1_score(target["test"]["label"], res_orig))
