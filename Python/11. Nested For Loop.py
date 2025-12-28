products = ['iPhone','Ipad','Macbook']
regions = ['USA','China','India']
revenue = [20,10,20,21,10,11,21,12,13]

i = 0

for product in products:
    for region in regions:
        rev = revenue[i]
        i = i + 1
        print(f"{product} {region} revenue: {rev}")

for i in range(5):
    print(i)
else:
    print("For loop terminated")