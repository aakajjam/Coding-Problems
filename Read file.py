# These commands will check the directory when pandas or numpy will not work
#import sys
#sys.path

import numpy as np
import pandas as pd

myData = pd.read_csv('favoriteMovies2022_raw.csv')
#print(myData)

#print(myData.dtypes)

for aCol in myData.columns:
    print(str(sum(myData[aCol].isna())) + " missing values for column " + aCol)
    # The column titles are like keys for the dictionary
    # The .isna() is searching for missing values for the keys

myData['Budget'] = myData['Budget'].fillna(np.nanmedian(myData['Budget']))
print(myData['Budget'])
# Instead of filling missing budget with zero it fills the missing budgets with median budget value
# The .fillna method returns a new column, so we assign it to the same column/original data sheet