'''
Assume df is a pandas dataframe object of the dataset given
'''

import numpy as np
import pandas as pd
import random


'''Calculate the entropy of the enitre dataset'''
# input:pandas_dataframe
# output:int/float
def get_entropy_of_dataset(df):
    last_column_name = df.columns[-1]
    proportion = np.array(df[last_column_name].value_counts()/len(df[last_column_name]))
    entropy = np.sum(- proportion * np.log2(proportion))
    return entropy


'''Return avg_info of the attribute provided as parameter'''
# input:pandas_dataframe,str   {i.e the column name ,ex: Temperature in the Play tennis dataset}
# output:int/float
def get_avg_info_of_attribute(df, attribute):
    # TODO
    total_rows = df.shape[0]
    unique_classes = np.unique(np.array(df[attribute]))
    sum = 0
    for i in unique_classes:
        df_i = df[df[attribute] == i]
        last_column_name = df_i.columns[-1]
        proportion = np.array(df_i[last_column_name].value_counts())
        multiplying_factor = np.sum(proportion)/total_rows
        en = get_entropy_of_dataset(df_i)
        sum += en * multiplying_factor
    avg_info = sum
    return avg_info


'''Return Information Gain of the attribute provided as parameter'''
# input:pandas_dataframe,str
# output:int/float
def get_information_gain(df, attribute):
    # TODO
    entropy_dataset = get_entropy_of_dataset(df)
    entropy_attribute = get_avg_info_of_attribute(df, attribute)
    information_gain = entropy_dataset - entropy_attribute
    return information_gain

#input: pandas_dataframe
#output: ({dict},'str')
def get_selected_attribute(df):
    '''
    Return a tuple with the first element as a dictionary which has IG of all columns 
    and the second element as a string with the name of the column selected

    example : ({'A':0.123,'B':0.768,'C':1.23} , 'C')
    '''
    # TODO
    columns =  list(df.columns.values)
    columns.pop()
    IG_columns = {i:0 for i in columns}
    IG_column = []
    max = -1
    max_column = ''
    for i in columns:
        df = df[pd.notnull(df[i])]
        IG_column.append(get_information_gain(df,i))
    for j,k in zip(columns,IG_column):
        IG_columns[j] = k
        if k > max:
            max = k
            max_column = j
    return(IG_columns,max_column)

