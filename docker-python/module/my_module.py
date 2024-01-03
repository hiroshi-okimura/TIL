import sys
print(sys.path)

import numpy as np
print(np.__file__)
arr_int32 = np.array([100, 200, 300, 400, 500], dtype=np.int32)
print(arr_int32)

arr1 = np.array([[1, 2],[100, 200]])
print(arr1)

arr2 = np.array([[3, 4],[300, 400]])
print(arr2)

arr_sum = arr1 + arr2
print(arr_sum)
