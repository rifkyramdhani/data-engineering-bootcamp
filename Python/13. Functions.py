expenses_a = [30,50,40,20]
expenses_b = [20,30,40,40]

total_expenses_a = 0
total_expenses_b = 0

for expense in expenses_a:
    total_expenses_a += expense

print(f"Total expenses for A: {total_expenses_a}")

for expense in expenses_b:
    total_expenses_b += expense

print(f"Total expenses for B: {total_expenses_b}")


# Using functions

def total_expenses(expenses):
    '''
    Docstring for total_expenses
    
    :param expenses: input list containing numbers
    :return: total sum of all numbers in input list
    '''
    total = 0
    for expense in expenses:
        total += expense
    return total 

total_expenses_func_a = total_expenses(expenses_a)
total_expenses_func_b = total_expenses(expenses_b)

print("\nTotal expenses using funtions")
print(f"Total expenses for A: {total_expenses_func_a}")
print(f"Total expenses for B: {total_expenses_func_b}")

print(help(total_expenses))