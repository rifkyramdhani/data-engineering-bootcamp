n = int(input("Enter a number :"))
print(n)

if n % 2 == 0:
    print(f"{n} is an even number")
else:
    print(f"{n} is an odd number")

indonesian = ['batagor', 'sate', 'siomay']
chinese = ['kwetiau','fuyunghai']

food = input("Enter the food name: ")

if food in indonesian:
    print(f"{food} is Indonesian food")
elif food in chinese:
    print(f"{food} is Chinese food")
else:
    print(f"{food} is not Indonesian or Chinese food")