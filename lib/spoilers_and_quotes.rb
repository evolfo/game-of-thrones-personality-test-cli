def random_spoiler(user, result, character)
	puts spoilers[character].sample
	end_menu(user, result)
end

def spoilers
  spoilers = {
	"Ramsay Snow" => ["Following the successful capture of Winterfell from the Ironborn, Ramsay holds Theon captive and utilizes extreme torture to break him into loyal submission; renaming him 'Reek'.", "Through an arrangement orchestrated by Petyr Baelish, Ramsay is wed to Sansa Stark, who escapes from Winterfell along with Theon.", "Ramsay's rule over the North comes to an end when Jon Snow retakes Winterfell with army of Free Folk and Stark loyalists."],
	"Qyburn" => ["Qyburn lost his maester's chain for necromancy.", "After the mountain is killed in combat by Prince Oberyn, Qyburn ressurects him as the newest member of the Kingsguard, Ser Robert Strong.", "Cersei appoints Qyburn as master of whisperers to replace Varys."],
	"Viserys Targaryen" => ["At Dany's wedding feast, Viserys meets the exile knight Ser Jorah Mormont, who swears himself to his service.", "The day of the ritual ceremony for Daenerys's unborn child, Rhaego, Jorah stops Viserys from stealing Daenerys's dragon eggs, intending to sell to the traders of Vaes Dothrak for gold to buy himself a sellsword army.", "Viserys says when he takes Westeros, he will kill the Usurper, King Robert I Baratheon, and also the Kingslayer, Ser Jaime Lannister."],
	"Cersei Lannister" => ["She began an incestuous relationship with her brother Jaime in her youth which has continued despite her marriage.", "Her three children, Joffrey, Myrcella and Tommen, are officially her husband Robert's, but in reality are the products of her incestuous relationship with Jaime.", "Cersei has been cited by her brother Tyrion to be one of the most dangerous people in Westeros, because of her absolute ruthlessness in the face of those she perceives as her enemies."],
	"Walder Frey" => ["Walder Frey orchestrated the Red Wedding where king Rob Stark, his wife Talisa, Robb's mother Catelyn were all killed along with many other Stark bannermen.", "For his part in the Red Wedding, Lord Walder is granted Riverrun and protection from vengeful Northerners by Tywin Lannister.", "Walder Frey's dominion over the Riverlands is weakened when Brynden Tully (after escaping the Red Wedding), Edmure Tully's uncle and a veteran of the War of the Ninepenny Kings, reclaims Riverrun from the Freys with what remains of House Tully's armies."],
	"Tywin Lannister" => ["Despite the several recent Kings in King's Landing, Tywin is the real power in King's Landing, and he is the true ruler of the city.", "Tywin steals his son Tyrion's lover Shae, turning her against him and sleeping with her which ulitmately leads to his death.", "Following the Battle of Blackwater, Tywin wastes no time in asserting his authority over King's Landing, shunning his grievously injured son; instead busying himself with his new position of Hand of the King."],
	"Petyr Baelish" => ["Petyr Baelish arrives with the Vale Knights of House Arryn just when the Stark force is about to be massacred in the Battle of the Bastards", "In season one he betrays Eddard, he holds a dagger to his throat, pointing out, 'I did warn you not to trust me.'", "He is the owner of many brothels in King's Landing that are subsequently destroyed when the High Sparrow takes control of the city."],
	"Gregor Clegane" => ["Gregor held his brother Sandor's face in a fire for playing with one of his toys without permission, horrifically scarring him.", "Gregor kills Prince Oberyn in battle but is later killed by poison from his wounds.", "He is resurrected by Qyburn and becomes even more loyal to Cersei."],
	"Theon Greyjoy" => ["Theon becomes Ramsay Bolton's slave through torture and is renamed 'Reek'.", "Theon betrays house Stark by seizing Winterfell when it is undefender and imprisoning Bran and Rickon.", "Despite fighting bravely and cutting down many of Euron's men, Theon watches helplessly as Euron takes his sister Yara hostage, daring him to intervene."],
	"Margaery Tyrell" => ["Margaery became Queen Consort through her marriage to King Joffrey Baratheon, and later his younger brother, King Tommen Baratheon, following Joffrey's death.", "Margaery, is arrested by the High Sparrow for giving false testimony, and dragged to prison.", "Margaery marries King Renly Baratheon, the lover of her brother Loras, though she's aware of their relationship."],
	"Brienne" => ["She defeats Jaime Lannister and Sandor Clegane in combat.", "She is blamed for the death of Renly Barathoen.", "She is captured by the Boltons and put in a pit to fight with a bear."],
	"Sansa Stark" => ["Her direwolf is killed by her father Ned Stark", "She gets married to Tyrion Lannister", "She unknowingly carries the poison in her hair necklace that kills Joffrey at his wedding."],
	"Eddard Stark" => ["Jon Snow is not his bastard son", "He fights Jaime Lannister, loses and gets his leg injured in the process.", "He has the chance to be king but does not take the chance when Robert Baratheon dies."],
	"Jon Snow" => ["His real name is Aegon Targaryen.", "His parents are Rhaeger Targaryen and Lyanna Stark.", "He becomes the Lord Commander of the Night's Watch."],
	"Davos Seaworth" => ["Stannis Baratheon cut four of his fingers because of his old life of being a smuggler.", "He lets Gendry escape with his life to avoid being sacrificed by the red god.", "He was sent on a mission to rescue Rickon to the island of Skagos."],
	"Tyrion Lannister" => ["He kills his father Tywin.", "He ends up finding out that his lover, Shae was sleeping with his father so he kills her in a fit of rage.", "He goes to Essos and meets Daenerys and joins her conquest to claim Westeros for her."],
	"Daenerys Targaryen" => ["One of her dragons are killed and turned into a zombie dragon.", "She conquers the land of Meereen, Astapor and Qarth", "She is captured by the Dothraki after Meereen is overtaken by rebels."],
	"Doran Martell" => ["He knew about the false dragon Aerys Targaryen which he wanted to use him as a way to overthrow Westeros and  make his daughter as his wife.", "He is parapelgic because he is suffering from gout.", "He is invited by Cersei to join the small council but he knows that to be a farce, only an attempt to get him out of Dorne."],
	"Sandor Clegane" => ["He was presumed dead after the fight with Brienne but turns out being alive living in a church.", "He defeats Beric Dondarrion by slicing off half his body in half.", "He joins Jon Snow to the north past the wall to fight the White Walkers."],
	"Arya Stark" => ["She masters the ability to change faces and becomes a Faceless Man.", "She throws away her wolf in fear of it getting killed because it bit Joffrey.", "She kills Littlefinger by slicing his throat while he tries to plea for his life."]
	  }
end

def play_quote(character)
	`say "#{quotes[character]}"`
end

def quotes
  {
	"Ramsay Snow" => "reeks dad",
	"Qyburn" => "zombies dad",
	"Viserys Targaryen" => "do not wake the dragon",
	"Cersei Lannister" => "when you play the game of thrones you win or you die. there is no middle ground.",
	"Walder Frey" => "you are too old",
	"Tywin Lannister" => "any man who must say, I am the king, is no true king",
	"Petyr Baelish" => "chaos isn't a pit. chaos is a ladder.",
	"Gregor Clegane" => "zombie guy",
	"Theon Greyjoy" => "also known as reek",
	"Margaery Tyrell" => "i exploded",
	"Brienne" => "im no lady",
	"Sansa Stark" => "the worst ones always live",
	"Eddard Stark" => "winter is coming",
	"Jon Snow" => "you know nothing",
	"Davos Seaworth" => "if your a famous smuggler, your not doing it right",
	"Tyrion Lannister" => "you are the god of tits and wine",
	"Daenerys Targaryen" => "dracaieris",
	"Doran Martell" => "uhhhhh",
	"Sandor Clegane" => "fuck the king",
	"Arya Stark" => "a girl has no face"
  }
end