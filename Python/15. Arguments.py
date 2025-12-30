def sum_all(*args):
    total = 0
    for num in args:
        total += num
    return total

total = sum_all(1,2,3,4,5)
print(total)

def company_info(**kwargs):
    for key in kwargs:
        print(key, kwargs[key])

company_info(name='PT. Indonesia',ceo='Rifky',address='Malang')

#lambda
x = lambda a,b: a*b
print(x(10,50))

#python built in functions

num = [60,56,78,34]

print(sum(num)) 
print(min(num)) 
print(max(num)) 

import math

print(math.sqrt(16))