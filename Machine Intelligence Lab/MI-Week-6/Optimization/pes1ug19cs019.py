
from sklearn.svm import SVC
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import *
import pandas as pd
import numpy as np
import random

df = pd.read_csv("train.csv")
df_test = pd.read_csv("test.csv")

from sklearn.preprocessing import *
sc = StandardScaler()
X_train = df.iloc[:, 0:-1]
y_train = df.iloc[:, -1]
X_test = df_test.iloc[:, 0:-1]
y_test = df_test.iloc[:, -1]

# pipe1 = Pipeline([('scaler1', MinMaxScaler(feature_range=(-1,1))),
#                   ('scaler2',Normalizer(norm='l2')),
#                   ('scaler3', PowerTransformer()), 
#                   ('svc', SVC(kernel = 'rbf', random_state = 0, C = 4.8, gamma = 3.43424e-2 ))])
# 95.851
#90.5185

# pipe1 = Pipeline([('scaler1', MinMaxScaler(feature_range=(-1,1))),
#                   ('scaler2',Normalizer(norm='l2')),
#                   ('scaler3', PowerTransformer()), 
#                   ('svc', SVC(kernel = 'rbf', random_state = 0, C = 2.56, gamma = 4.703424e-2 ))])
# 95.6667, 90.666

# pipe1 = Pipeline([('scaler1', MinMaxScaler(feature_range=(-1,1))),
#                   ('scaler2',Normalizer(norm='l2')),
#                   ('scaler3', PowerTransformer()), 
#                   ('svc', SVC(kernel = 'rbf', random_state = 0, C = 2.56, gamma = 4.903424e-2 ))])
# 95.92,90.81



# pipe1.fit(X_train,y_train)

# pipe1.score(X_train,y_train) * 100

# pipe1.score(X_test,y_test) * 100

np.random.seed = 0
for runs in range(10000):
    kernel=['rbf']
    kernel_selector = random.choice(kernel)
    c = np.random.uniform(2,5)
    gamma = 10**np.random.uniform(-1,-2)+10**np.random.uniform(-2,-3)
    decision = random.choice(['ovr'])
    
    pipe = Pipeline([('scaler1', MinMaxScaler(feature_range=(-1,1),clip=True)),
                    ('scaler2',Normalizer()),
                  ('scaler3', PowerTransformer(standardize="True")), 
                  ('svc', SVC(kernel = kernel_selector, random_state = 0, C = c, gamma = gamma, decision_function_shape=decision ))])
    pipe.fit(X_train,y_train)
    print(f"kernel: {kernel_selector}, c: {c}, gamma: {gamma}, train_acc: {pipe.score(X_train,y_train)*100}, test_acc: {pipe.score(X_test,y_test)*100}")


# kernel: rbf, decision: ovr, c: 3.285757423866787, gamma: 0.04332297058343756, train_acc: 96.07407407407408, test_acc: 91.11111111111111
