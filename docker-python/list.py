friuts =  ['apple', 'banana', 'orange']
for x in enumerate(friuts):
    print(x)


square_list = [x**2 for x in range(10)]
print(square_list)

even_square_list = [x**2 for x in range(10) if x % 2 == 0]
print(even_square_list)