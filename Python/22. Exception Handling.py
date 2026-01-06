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


try:
    file = open("example.txt","r")
    content = file.read()
    print(content)
except FileNotFoundError:
    print("File not found")
finally: # will be executed either try or except
    if file:
        file.close()
    print("The file is closed")