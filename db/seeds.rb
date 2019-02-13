GotCharacter.destroy_all

brienne = GameOfThronesApi.find_character("Brienne")
sansa = GameOfThronesApi.find_character("Sansa Stark")
eddard = GameOfThronesApi.find_character("Eddard Stark")
jon = GameOfThronesApi.find_character("Jon Snow")
davos = GameOfThronesApi.find_character("Davos Seaworth") 
tyrion = GameOfThronesApi.find_character("Tyrion Lannister")
daenerys = GameOfThronesApi.find_character("Daenerys Targaryen")
doran = GameOfThronesApi.find_character("Doran Martell") 
robert = GameOfThronesApi.find_character("Robert I Baratheon")
arya = GameOfThronesApi.find_character("Arya Stark")
theon = GameOfThronesApi.find_character("Theon Greyjoy")
stannis = GameOfThronesApi.find_character("Stannis Baratheon")
melisandre = GameOfThronesApi.find_character("Melisandre")
varys = GameOfThronesApi.find_character("Varys")
tywin = GameOfThronesApi.find_character("Tywin Lannister")
euron = GameOfThronesApi.find_character("Euron Greyjoy")
cersei = GameOfThronesApi.find_character("Cersei Lannister")
gregor = GameOfThronesApi.find_character("Gregor Clegane")
joffrey = GameOfThronesApi.find_character("Joffrey Baratheon")
qyburn = GameOfThronesApi.find_character("Qyburn")

GotCharacter.create(name: brienne[0]["name"], min_score: 1, max_score: 5)
GotCharacter.create(name: sansa[0]["name"], min_score: 6, max_score: 10)
GotCharacter.create(name: eddard[0]["name"], min_score: 11, max_score: 15)
GotCharacter.create(name: jon[0]["name"], min_score: 16, max_score: 20)
GotCharacter.create(name: davos[0]["name"], min_score: 21, max_score: 25)
GotCharacter.create(name: tyrion[0]["name"], min_score: 26, max_score: 30)
GotCharacter.create(name: daenerys[0]["name"], min_score: 31, max_score: 35)
GotCharacter.create(name: doran[0]["name"], min_score: 36, max_score: 40)
GotCharacter.create(name: robert[0]["name"], min_score: 41, max_score: 45)
GotCharacter.create(name: arya[0]["name"], min_score: 46, max_score: 50)
GotCharacter.create(name: theon[0]["name"], min_score: 51, max_score: 55)
GotCharacter.create(name: stannis[0]["name"], min_score: 56, max_score: 60)
GotCharacter.create(name: melisandre[0]["name"], min_score: 61, max_score: 65)
GotCharacter.create(name: varys[0]["name"], min_score: 66, max_score: 70)
GotCharacter.create(name: tywin[0]["name"], min_score: 71, max_score: 75)
GotCharacter.create(name: euron[0]["name"], min_score: 76, max_score: 80)
GotCharacter.create(name: qyburn[0]["name"], min_score: 81, max_score: 85)
GotCharacter.create(name: cersei[0]["name"], min_score: 86, max_score: 90)
GotCharacter.create(name: gregor[0]["name"], min_score: 91, max_score: 95)
GotCharacter.create(name: joffrey[0]["name"], min_score: 96, max_score: 100)

# brienne_description = ""
# sansa_description = ""
# eddard_description = ""
# jon_description = ""
# bran_description = ""
# tyrion_description = ""
# daenarys_description = ""
# sandor_description = ""
# robert_description = ""