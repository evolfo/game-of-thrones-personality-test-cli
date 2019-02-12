GOTCharacter.destroy_all

brienne = GameOfThronesApi.find_character("Brienne")
sansa = GameOfThronesApi.find_character("Sansa")
eddard = GameOfThronesApi.find_character("Eddard Stark")
jon = GameOfThronesApi.find_character("Jon Snow")
bran = GameOfThronesApi.find_character("Brandon Stark")

GOTCharacter.create(name: brienne[0]["name"], score: (1..5))
GOTCharacter.create(name: sansa[0]["name"], score: (1..5))
GOTCharacter.create(name: eddard[0]["name"], score: (1..5))
GOTCharacter.create(name: jon[0]["name"], score: (1..5))
GOTCharacter.create(name: bran[1]["name"], score: (1..5))
