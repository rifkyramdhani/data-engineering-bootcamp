monthly_sales = [42, 43, 33, 46, 31, 40]
month = ['Jan','Feb','Mar','Apr','May','Jun']

threshold = 35

for sales, month in zip(monthly_sales,month):
    if sales < threshold:
        print(f"{sales} is below the threshold in {month}")
        break
    else:
        print(f"{sales} is greather than the threshold in {month}")