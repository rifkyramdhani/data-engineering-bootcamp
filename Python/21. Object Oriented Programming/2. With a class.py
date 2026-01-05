import datetime

class CricketPlayer:
    def __init__(self, fname, lname, birth_year, team):
        self.first_name = fname
        self.last_name = lname
        self.scores = []
        self.birth_year = birth_year
        self.team = team
    
    def add_score(self, score):
        self.scores.append(score)
    
    def avg_score(self):
        return sum(self.scores)/len(self.scores)
    
    def get_age(self):
        return datetime.datetime.now().year - self.birth_year

rifky = CricketPlayer('rifky', 'ramdhani', 1998, 'arema')
rifky.add_score(90)
rifky.add_score(180)
rifky.add_score(160)

print(rifky.first_name)
print(rifky.scores)
print(rifky.avg_score())

samson = CricketPlayer('samson', 'hidayat', 1987, 'persema')
samson.add_score(40)
samson.add_score(50)
samson.add_score(10)

print(samson.first_name)
print(samson.scores)
print(samson.avg_score())


