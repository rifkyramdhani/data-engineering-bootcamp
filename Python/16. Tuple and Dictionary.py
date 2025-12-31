value_a = [5,4,3] # list
value_b = (5,6,7) # tuple

def find_pe_and_pb(price, eps, book_value):
    pe = price/eps
    pb = price/book_value
    return pe,pb

val_pe, val_pb = find_pe_and_pb(100, 50, 80)

print(val_pe)
print(val_pb)

print(type(find_pe_and_pb(100, 50, 80))) # the result is tuple

contacts = [('monica',628996473722),('angel',628747463732),('fufufafa',628828727363)]

for contact in contacts:
    if contact[0] == 'fufufafa':
        print(contact[1])

# dictionary

d = {
    1: 'aaa',
    2: 'bbb',
    3: 'ccc',
    4: 'ddd'
}

print(d)

d_1 = {
    'herman':62738474757,
    'siti':629384954,
    'asep':6298494444 
}

print(d_1['siti'])

print(d_1['asep'])

print(d_1.get('hermana')) # will return none

d_1['siti'] = 626262626262 # edit value

print(d_1)

d_1['fufufafa'] = 62222222222

print(d_1)

del d_1['fufufafa']

print(d_1)

check_asep = 'asep' in d_1

print(check_asep)

d_2 = {
    'herman': {'age': 27, 'address': 'indonesia'},
    'siti': {'age': 28, 'address': 'nigeria'}
}

print(d_2['herman']['age'])

print(d_2.keys())

apple_rev = {
    'china' : {
        'ipad' : 20,
        'macbook' : 15,
        'iphone' : 18
    },
    'korea' : {
        'ipad' : 21,
        'macbook' : 13,
        'iphone' : 16
    },
    'indonesia' : {
        'ipad' : 21,
        'macbook' : 19,
        'iphone' : 14
    }
}

for country, product_data in apple_rev.items():
    for product, rev in product_data.items():
        print(f'{country} {product} with ${rev} millions')