import datetime

def get_age(player):
    current_year = datetime.datetime.now().year
    return current_year - player['birth_year']

def get_avg_scores(player):
    return sum(player['scores'])/len(player['scores'])

rifky = {
    'first_name' : 'rifky',
    'last_name' : 'ramdhani',
    'scores' : [],
    'birth_year' : 1998
}

rifky['scores'].append(80)
rifky['scores'].append(100)
rifky['scores'].append(0)

print(get_age(rifky))
print(get_avg_scores(rifky))


samson = {
    'first_name' : 'samson',
    'last_name' : 'fufufafa',
    'scores' : [],
    'birth_year' : 1980
}

samson['scores'].append(80)
samson['scores'].append(60)
samson['scores'].append(200)

print(get_age(samson))
print(get_avg_scores(samson))