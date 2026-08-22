expenses = [200,300,400,500]

total = 0

# for expense in expenses:
#     total += expense

# for i in range(len(expenses)):
#     expense = expenses[i]
#     print(f"Month: {i+1} expense: {expense}")
#     total += expense

# print(total) 

# for i, expense in enumerate(expenses):
#     print(f"Month: {i+1} expense: {expense}")
#     total += expense
# print(total)

monthly_sales = [34,33,32,30,34,29,28,30]
months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug']

threshold = 30

for sales,month in zip(monthly_sales,months):
    if sales < threshold:
        print(f"{sales} is below than threshold in {month}")
        break
    else:
        print(f"{sales} is greater than threshold in {month}")

for i in range(1,11): # print only odd number
    if i % 2 == 0:
        continue
    print(i)

n = 0

while n < 10:
    print(n)
    n += 1

products = ['iPhone','Ipad','Macbook']
regions = ['USA','China','India']
revenue = [20,10,20,21,10,11,21,12,13]

i = 0

for product in products:
    for region in regions:
        rev = revenue[i]
        i += 1
        print(f"{product} {region} revenue : {rev}")
