expenses = [1200,1500,500,1700]

total_expenses = 0

for i in expenses:
    total_expenses = total_expenses + i

print(total_expenses)

for i in range(len(expenses)):
    expense = expenses[i]
    print(f"Month: {i+1} expense: {expense}")
    total_expenses += expense

# another option
for i, expense in enumerate(expenses):
    print(f"Month: {i+1} expense: {expense}")
    total_expenses += expense


print("Total expenses:",total_expenses)