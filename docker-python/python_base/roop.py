while True:
    age = int(input("Enter your age: "))
    if not 0 < age < 120:
        print("Invalid age")
        continue
    else:
        print("Your age is: {}".format(age))
        break