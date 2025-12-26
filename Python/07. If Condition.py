n = int(input("Input the number: "))

# Example 1
print("Example 1 using if")
if n % 2 == 0:
    print(f"{n} is even number")
else:
    print(f"{n} is odd number")

# Example 2
print("Example 2 somple if")
message = "Number is even" if n % 2 == 0 else "Number is odd"
print(message)

# Example 3
print("Example 3 using if not")
if not n % 2 == 0:
    print(f"{n} is odd number")
else:
    print(f"{n} is even number")

# Example 4
print("Example 4 using if with and")
if n % 2 == 0 and n > 10:
    print(f"{n} is matched")
else:
    print(f"{n} is not matched")

# Example 5
print("Example 5 using if with or")
if n % 2 == 0 or n > 10:
    print(f"{n} is matched")
else:
    print(f"{n} is not matched")

# Example 6
indonesian = ['batagor', 'sate', 'siomay']
chinese = ['kwetiau','fuyunghai']

food = input('Enter food name: ')

if food in indonesian:
    print(f"{food} is Indonesian")
elif food in chinese:
    print(f"{food} is chinese")
else:
    print("I don't know this food")