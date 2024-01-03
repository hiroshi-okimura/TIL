import time
print(time.time())


def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


before = time.time()
print(fib(10))
after = time.time()
print(after - before)

print(time.localtime())