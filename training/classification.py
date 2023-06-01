import pandas as pd
import random
import sys
random.seed(84210)
print(sys.argv)
data = pd.read_csv(sys.argv[1])
print(len(data))
valid_ids = sorted(random.sample(range(0, len(data)), 5000))
train_ids = []
set_valid = set(valid_ids)
for i in range(0, len(data)):
    if i not in set_valid:
        train_ids.append(i)
valid = data.iloc[valid_ids,:]
train = data.iloc[train_ids, :]
valid[['text','label']].to_csv("idmb_selected_validation.csv", index = False)
train[['text','label']].to_csv("idmb_selected_train.csv", index = False)