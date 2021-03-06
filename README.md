# Game of Thrones Character Quiz

![Login Page](https://i.imgur.com/UhoF3uM.png)

Take our 10 question quiz and find out which Game of Thrones character you are! There are 20 possibilities:

1. Brienne of Tarth
2. Sansa Stark
3. Eddard Stark
4. Jon Snow
5. Davos Seaworth
6. Tyrion Lannister
7. Daenarys Targaryen
8. Doran Martell
9. Sandor Clegane
10. Arya Stark
11. Theon Greyjoy
12. Petyr Baelish
13. Ramsay Snow
14. Walder Frey
15. Tywin Lannister
16. Viserys Targaryen
17. Cersei Lannister
18. Gregor Clegane
19. Margaery Tyrell
20. Qyburn

Quiz Complete Screen:

![Picture](https://i.imgur.com/qkNCzIB.png)

Character Detail Screen: 

![Picture](https://i.imgur.com/4nLokdS.png)

## Installation Instructions

Clone this repository and then in your terminal type:

```
bundle install
```

to install the required gems

```
rake db:migrate
```

to create the tables in the database

```
rake db:seed
```

to seed the database with the characters. Finally, run the program:

```
ruby bin/run.rb
```

and enjoy!

Built with: 
* Ruby
* TTY-Prompt
* Nokogiri
* A Song of Ice and Fire API

Creators:
* Angelo Spampinato (https://github.com/evolfo/)
* Andy Reyes (https://github.com/andyrey7)
