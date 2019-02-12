GotCharacter.destroy_all

brienne = GameOfThronesApi.find_character("Brienne")
sansa = GameOfThronesApi.find_character("Sansa")
eddard = GameOfThronesApi.find_character("Eddard Stark")
jon = GameOfThronesApi.find_character("Jon Snow")
bran = GameOfThronesApi.find_character("Brandon Stark")
tyrion = GameOfThronesApi.find_character("Tyrion Lannister")
daenerys = GameOfThronesApi.find_character("Daenerys Targaryen")
sandor = GameOfThronesApi.find_character("Sandor Clegane")
robert = GameOfThronesApi.find_character("Robert I Baratheon")
arya = GameOfThronesApi.find_character("Arya Stark")
jaime = GameOfThronesApi.find_character("Jaime Lannister")
stannis = GameOfThronesApi.find_character("Stannis Baratheon")
melisandre = GameOfThronesApi.find_character("Melisandre")
varys = GameOfThronesApi.find_character("Varys")
tywin = GameOfThronesApi.find_character("Tywin Lannister")
littlefinger = GameOfThronesApi.find_character("Petyr Baelish")
cersei = GameOfThronesApi.find_character("Cersei Lannister")
gregor = GameOfThronesApi.find_character("Gregor Clegane")
joffrey = GameOfThronesApi.find_character("Joffrey Baratheon")
ramsay = GameOfThronesApi.find_character("Ramsay Snow")

GotCharacter.create(name: brienne[0]["name"], min_score: 1, max_score: 5)
GotCharacter.create(name: sansa[0]["name"], min_score: 6, max_score: 10)
GotCharacter.create(name: eddard[0]["name"], min_score: 11, max_score: 15)
GotCharacter.create(name: jon[0]["name"], min_score: 16, max_score: 20)
GotCharacter.create(name: bran[1]["name"], min_score: 21, max_score: 25)
GotCharacter.create(name: tyrion[0]["name"], min_score: 26, max_score: 30)
GotCharacter.create(name: daenerys[0]["name"], min_score: 31, max_score: 35)
GotCharacter.create(name: sandor[0]["name"], min_score: 36, max_score: 40)
GotCharacter.create(name: robert[0]["name"], min_score: 41, max_score: 45)
GotCharacter.create(name: arya[0]["name"], min_score: 46, max_score: 50)
GotCharacter.create(name: jaime[0]["name"], min_score: 51, max_score: 55)
GotCharacter.create(name: stannis[0]["name"], min_score: 56, max_score: 60)
GotCharacter.create(name: melisandre[0]["name"], min_score: 61, max_score: 65)
GotCharacter.create(name: varys[0]["name"], min_score: 66, max_score: 70)
GotCharacter.create(name: tywin[0]["name"], min_score: 71, max_score: 75)
GotCharacter.create(name: littlefinger[0]["name"], min_score: 76, max_score: 80)
GotCharacter.create(name: cersei[0]["name"], min_score: 81, max_score: 85)
GotCharacter.create(name: gregor[0]["name"], min_score: 86, max_score: 90)
GotCharacter.create(name: joffrey[0]["name"], min_score: 91, max_score: 95)
GotCharacter.create(name: ramsay[0]["name"], min_score: 96, max_score: 100)
