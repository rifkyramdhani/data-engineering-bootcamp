x = input("Input the first number: ")
y = input("Input the second number: ")

try:
    d = int(x)/int(y)
except ZeroDivisionError as ze:
    print("Exception occured:", ze)
    d = -1
except ValueError as ve:
    print("Exception occured:", ve)
    d = 0
print("The result is", d)