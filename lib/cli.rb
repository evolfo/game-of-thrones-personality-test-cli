#----------------------------------------------------------------------------#
#---------------------------- Ascii------------------------------------------#
#----------------------------------------------------------------------------#

def welcome_screen
	fork{ exec 'afplay', "./sounds/GOT_theme_song.mp3"}
	system "clear"
	font = TTY::Font.new(:doom)
	puts font.write("Game of Thrones Quiz")
	sleep(1)
end

#----------------------------------------------------------------------------#
#---------------------------- Main Menu--------------------------------------#
#----------------------------------------------------------------------------#

def main_menu(user)
	prompt.select(pastel.white("Choose something")) do |menu|
		menu.choice 'Take the test!', -> {question1(user)}
		menu.choice 'View the list of all characters', -> {character_list}
		menu.choice 'View your test history', -> {quiz_history(user)}
		menu.choice 'Update User-Name', -> {update_user(user)}
		menu.choice 'Delete test history', -> {delete_user_history(user)}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu(user)
end

#----------------------------------------------------------------------------#
#---------------------------- Questions--------------------------------------#
#----------------------------------------------------------------------------#

def question1(user)
	new_test = Test.create(user_id: user.id, got_character_id: 0, score: 0)
	user.tests << new_test
	prompt.select(pastel.white("What is your goal in life?")) do |menu|
		 menu.choice 'My goal is to protect the world and those closest to me', -> {new_test.score += 0}
		 menu.choice 'I want to get rich or die trying', -> {new_test.score += 3}
		 menu.choice "I don't care", -> {new_test.score += 5}
		 menu.choice 'I want to watch the world burn', -> {new_test.score += 10}
	end
	new_test.save
	system "clear"
	question2(user, new_test)
end

def question2(user, new_test)
	prompt.select(pastel.white("What kind of person are you?")) do |menu|
		menu.choice 'Manipulative', -> {new_test.score += 10}
		menu.choice 'Vengeful', -> {new_test.score += 7}
		menu.choice 'Empathetic', -> {new_test.score += 1}
		menu.choice 'Courageous', -> {new_test.score += 3}
	end
	new_test.save
	system "clear"
	question3(user, new_test)
end

def question3(user, new_test)
	prompt.select(pastel.white("What is your favorite food?")) do |menu|
		menu.choice 'Shark Fin Soup', -> {new_test.score += 10}
		menu.choice 'Horse Heart', -> {new_test.score += 5}
		menu.choice 'Pigeon Pie', -> {new_test.score += 3}
		menu.choice 'Lemon Cake', -> {new_test.score += 1}
	end
	new_test.save
	system "clear"
	question4(user, new_test)
end

def question4(user, new_test)
	prompt.select(pastel.white("What type of pets do you like?")) do |menu|
		menu.choice 'Wolf', -> {new_test.score += 0}
		menu.choice 'Stag', -> {new_test.score += 4}
		menu.choice 'Lion', -> {new_test.score += 8}
		menu.choice 'Human', -> {new_test.score += 10}
	end
	new_test.save
	system "clear"
	question6(user, new_test)
end

def question6(user, new_test)
	prompt.select(pastel.white("What is the greatest threat to Westeros?")) do |menu|
		menu.choice 'White walkers', -> {new_test.score += 0}
		menu.choice 'The Targaryens/Dragons', -> {new_test.score += 10}
		menu.choice 'The Lannisters', -> {new_test.score += 5}
		menu.choice 'Climate Change', -> {new_test.score += 3}
	end
	new_test.save
	system "clear"
	question7(user, new_test)
end

def question7(user, new_test)
	prompt.select(pastel.white("What would you rather do:")) do |menu|
		menu.choice 'Take the black', -> {new_test.score += 3}
		menu.choice 'Save the kingdom but sacrifice yourself', -> {new_test.score += 1}
		menu.choice 'Be Gregor Clegane', -> {new_test.score += 10}
		menu.choice 'Bend the knee and dishonor yourself and your house', -> {new_test.score += 4}
	end
	new_test.save
	system "clear"
	question8(user, new_test)
end

def question8(user, new_test)
	puts pastel.white("You're traveling to a distant land with a group and decide to set up camp. Quickly you realize that there's not enough food for everyone, what do you do?")
	prompt.select("") do |menu|
		menu.choice "Kill everyone else and eat to your heart's content", -> {new_test.score += 10}
		menu.choice 'Suggest a free for all to determine who gets fed', -> {new_test.score += 8}
		menu.choice 'Make sure everyone else is fed before you take anything', -> {new_test.score += 0}
		menu.choice 'Evenly distribute the food', -> {new_test.score += 2}
	end
	new_test.save
	system "clear"
	question9(user, new_test)
end

def question9(user, new_test)
	puts pastel.white("You're on the Kingsroad and you come across an injured person that's unconcious. What do you do?")
	prompt.select("") do |menu|
		menu.choice 'Kill them to ease their suffering', -> {new_test.score += 9}
		menu.choice 'Ignore them and keep moving', -> {new_test.score += 8}
		menu.choice 'Do your best to heal them', -> {new_test.score += 3}
		menu.choice 'Take them to the nearest town to get help', -> {new_test.score += 1}
	end
	new_test.save
	system "clear"
	question10(user, new_test)
end

def question10(user, new_test)
	puts pastel.white("You're surrounded by an army far superior to yours and the enemy general is asking for you to surrender. What will you do?")
	prompt.select("") do |menu|
		menu.choice 'Fight to the last man', -> {new_test.score += 1}
		menu.choice 'Run away', -> {new_test.score += 6}
		menu.choice 'Surrender and hope for the best', -> {new_test.score += 3}
		menu.choice 'Pretend to negotiate but attempt an assassination', -> {new_test.score += 9}
	end
	new_test.save
	system "clear"
	question11(user, new_test)
end

def question11(user, new_test)
	puts pastel.white("Your lord of your house dies unexpectadly and there is no heir. What do you do?")
	prompt.select("") do |menu|
		menu.choice 'Get rid of all competition', -> {new_test.score += 10}
		menu.choice 'Work to place a lord that is easy to manipulate', -> {new_test.score += 8}
		menu.choice 'Arrange a vote', -> {new_test.score += 0}
		menu.choice 'Arrange a tournament', -> {new_test.score += 3}
	end
	new_test.save
	system "clear"
	display_character_match(user)
end

#----------------------------------------------------------------------------#
#---------------------------- Ending + History ------------------------------#
#----------------------------------------------------------------------------#

def display_character_match(user)
	fork { exec "killall", "afplay"} #stops the music
	result = GotCharacter.all.find do |character|
		user.tests.last.score >= character.min_score && user.tests.last.score <= character.max_score
	end
	current_test = user.tests.last
	current_test.got_character_id = result.id
	current_test.save 	
	system "clear"
	puts "You are #{pastel.decorate(result.name, :red, :bold)}!"
	puts char_description(result.name.split.join("_"))
	sleep(2)
	play_quote(result.name) #plays quote from the character you got
	end_menu(user, result)
end

def end_menu(user, result)
	prompt.select(pastel.white("Choose an option")) do |menu|
		menu.choice 'Return to the main menu', -> {main_menu(user)}
		menu.choice "See if you're still alive", -> {char_alive?(user, result, result.name.split.join("_"))}
		menu.choice "Random spoiler!", -> {random_spoiler(user, result, result.name)}
		menu.choice 'Exit', -> {exit_app}
	end
end

def quiz_history(user)
	user.tests.each_with_index do |test, index|
		puts "#{index + 1}.) #{test.got_character.name}"
	end
end

def character_list
	characters = GotCharacter.all.map {|char| char.name}
	characters << "Exit"
	character = prompt.select(pastel.white("Select a character to find out more about them"), characters, per_page: 21)
	if character == "Exit"
	end
	char_info(character, character.split.join("_"))
end

def delete_user_history(user)
	Test.where(user_id: user.id).destroy_all
	puts 'Your history has been deleted!!'
	user.tests.clear
end

#----------------------------------------------------------------------------#
#-------------------------Helper Methods-------------------------------------#
#----------------------------------------------------------------------------#

def user_check(username)
	User.find_or_create_by(name: username)
end

def prompt
	TTY::Prompt.new
end

def pastel
	Pastel.new
end

def create_user
	puts "Please enter your name:"
	name = gets.chomp
	user = user_check(name)
	main_menu(user)
end

def update_user(user)
	puts "Please type in your new username"
	answer = gets.chomp
	User.update(user.id, :name => answer)
	puts "Your new username is #{answer}."
end

def exit_app
	fork { exec "killall", "afplay"}
	exit
end