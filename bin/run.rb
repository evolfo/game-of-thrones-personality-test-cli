require_relative '../config/environment'
require_relative '../lib/character.rb'
require_relative '../lib/description_scrape.rb'
require 'tty-prompt'
require 'tty-table'


puts "Welcome to the Game of Thrones character quiz. Take this quiz to see which character you are!"
sleep(1)


#----------------------------------------------------------------------------#
#---------------------------- Ascii------------------------------------------#
#----------------------------------------------------------------------------#
def welcome_screen
	music = fork{ exec 'afplay', "./sounds/GOT_theme_song.mp3"}
	puts "           ____ _____  _____ ___ ___     ____  / __/
                    / __ `/ __ `/ __ `__ \/ _ \   / __ \/ /_
                   / /_/ / /_/ / / / / / /  __/  / /_/ / __/
                   \__, /\__,_/_/ /_/ /_/\___/   \____/_/
                  /____/
                       __  __
                      / /_/ /_  _________  ____  ___  _____
                     / __/ __ \/ ___/ __ \/ __ \/ _ \/ ___/
                    / /_/ / / / /  / /_/ / / / /  __(__  )
                    \__/_/ /_/_/   \____/_/ /_/\___/____/

             __                          __                           _
       _____/ /_  ____ __________ ______/ /____  _____   ____ ___  __(_)___
      / ___/ __ \/ __ `/ ___/ __ `/ ___/ __/ _ \/ ___/  / __ `/ / / / /_  /
     / /__/ / / / /_/ / /  / /_/ / /__/ /_/  __/ /     / /_/ / /_/ / / / /_
     \___/_/ /_/\__,_/_/   \__,_/\___/\__/\___/_/      \__, /\__,_/_/ /___/
                                                         /_/
	"
	sleep(2)
	system "clear"
end
#----------------------------------------------------------------------------#
#---------------------------- Ascii------------------------------------------#
#----------------------------------------------------------------------------#




#----------------------------------------------------------------------------#
#---------------------------- Main Menu--------------------------------------#
#----------------------------------------------------------------------------#
def main_menu(user)
	prompt.select("Choose something") do |menu|
		menu.choice 'Take The Quiz!', -> {question1(user)}
		menu.choice 'View The List Of All Characters', -> {character_list}
		menu.choice 'View Your Quiz history', -> {quiz_history(user)}
		menu.choice 'Update User-Name', -> {update_user(user)}
		menu.choice 'Delete Quiz history', -> {delete_user_history(user)}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu(user)
end
#----------------------------------------------------------------------------#
#---------------------------- Main Menu--------------------------------------#
#----------------------------------------------------------------------------#




#----------------------------------------------------------------------------#
#-------------------------Helper Methods--------------------------------------#
#----------------------------------------------------------------------------#

def user_check(name)
	User.find_or_create_by(name: name)
end

def prompt
	TTY::Prompt.new
end

def create_user
	puts "Please enter your name:"
	name = gets.chomp
	user = user_check(name)
	#user = User.create(name: name)
	main_menu(user)
end

def character_list
	GotCharacter.all.each do |character|
		puts character.name
	end
end

def quiz_history(user)
	user.tests.each_with_index do |test, i|
		puts "#{i+1}. Your character was #{test.got_character.name}"
	end
end

def update_user(user)
	puts "Please type in your new username"
	answer = gets.chomp
	User.update(user.id, :name => user, :name => answer)
	puts "Your new username is #{answer}."
end

def delete_user_history(user)
	Test.where(user_id: user.id).destroy_all
	puts 'Your history has been deleted!!'
	user.tests.clear
end

def display_character_match(user)
	result = GotCharacter.all.find do |character|
		user.tests.last.score >= character.min_score && user.tests.last.score <= character.max_score
	end
	current_test = user.tests.last
	current_test.got_character_id = result.id
	current_test.save
	puts "You are #{result.name}!"
	if user.tests.last.score > 61
		`say "You evil fuck"`
	end
	sleep(2)
end

def happy_goodbye
	`say "Valar morghoulis, You finished it."`
end

def exit_app
	fork{ exec "killall", "afplay"}
	exit
end

#----------------------------------------------------------------------------#
#-------------------------Helper Methods--------------------------------------#
#----------------------------------------------------------------------------#





#----------------------------------------------------------------------------#
#---------------------------- Questions--------------------------------------#
#----------------------------------------------------------------------------#
def question1(user)
	new_test = Test.create(user_id: user.id, got_character_id: 0, score: 0)
	user.tests << new_test
	prompt.select("What is your goal in life?") do |menu|
		 menu.choice 'My goal is to protect the world and those closest to me', -> {new_test.score += 0}
		 menu.choice 'I want to get rich or die trying', -> {new_test.score += 3}
		 menu.choice "I don't care", -> {new_test.score += 5}
		 menu.choice 'I want to watch the world burn', -> {new_test.score += 10}
	end
	new_test.save
	question2(user, new_test)
end

def question2(user, new_test)
	prompt.select("What kind of person are you") do |menu|
		menu.choice 'Manipulative', -> {new_test.score += 10}
		menu.choice 'Vengeful', -> {new_test.score += 7}
		menu.choice 'Empathetic', -> {new_test.score += 1}
		menu.choice 'Courageous', -> {new_test.score += 3}
	end
	new_test.save
	question3(user, new_test)
end

def question3(user, new_test)
	prompt.select("What is your favorite food?") do |menu|
		menu.choice 'Shark Fin Soup', -> {new_test.score += 10}
		menu.choice 'Horse Heart', -> {new_test.score += 5}
		menu.choice 'Pigeon Pie', -> {new_test.score += 3}
		menu.choice 'Lemon Cake', -> {new_test.score += 1}
	end
	new_test.save
	question4(user, new_test)
end

def question4(user, new_test)
	prompt.select("What type of pets do you like?") do |menu|
		menu.choice 'Wolf', -> {new_test.score += 0}
		menu.choice 'Stag', -> {new_test.score += 4}
		menu.choice 'Lion', -> {new_test.score += 8}
		menu.choice 'Human', -> {new_test.score += 10}
	end
	new_test.save
	question5(user, new_test)
end
def question5(user, new_test)
	prompt.select("What is the greatest threat to Westeros?") do |menu|
		menu.choice 'White walkers', -> {new_test.score += 0}
		menu.choice 'The Targaryens/Dragons', -> {new_test.score += 10}
		menu.choice 'The Lannisters', -> {new_test.score += 5}
		menu.choice 'Climate Change', -> {new_test.score += 3}
	end
	new_test.save
	question6(user, new_test)
end

def question6(user, new_test)
	prompt.select("What would you rather do:") do |menu|
		menu.choice 'Take the black', -> {new_test.score += 3}
		menu.choice 'Save the kingdom but sacrifice yourself', -> {new_test.score += 1}
		menu.choice 'Be Gregor Clegane', -> {new_test.score += 10}
		menu.choice 'Bend the knee and dishonor yourself and your house', -> {new_test.score += 4}
	end
	new_test.save
	question7(user, new_test)
end

def question7(user, new_test)
	puts "You're traveling to a distant land with a group and decide to set up camp. Quickly you realize that there's not enough food for everyone, what do you do?"
	prompt.select("") do |menu|
		menu.choice "Kill everyone else and eat to your heart's content", -> {new_test.score += 10}
		menu.choice 'Suggest a free for all to determine who gets fed', -> {new_test.score += 8}
		menu.choice 'Make sure everyone else is fed before you take anything', -> {new_test.score += 0}
		menu.choice 'Evenly distribute the food', -> {new_test.score += 2}
	end
	new_test.save
	question8(user, new_test)
end

def question8(user, new_test)
	puts "You're on the Kingsroad and you come across an injured person that's unconcious. What do you do?"
	prompt.select("") do |menu|
		menu.choice 'Kill them to ease their suffering', -> {new_test.score += 9}
		menu.choice 'Ignore them and keep moving', -> {new_test.score += 8}
		menu.choice 'Do your best to heal them', -> {new_test.score += 3}
		menu.choice 'Take them to the nearest town to get help', -> {new_test.score += 1}
	end
	new_test.save
	question9(user, new_test)
end

def question9(user, new_test)
	puts "You're surrounded by an army far superior to yours and the enemy general is asking for you to surrender. What will you do?"
	prompt.select("") do |menu|
		menu.choice 'Fight to the last man', -> {new_test.score += 1}
		menu.choice 'Run away', -> {new_test.score += 6}
		menu.choice 'Surrender and hope for the best', -> {new_test.score += 3}
		menu.choice 'Pretend to negotiate but attempt an assassination', -> {new_test.score += 9}
	end
	new_test.save
	question10(user, new_test)
end

def question10(user, new_test)
	puts "Your lord of your house dies unexpectdely and there is no heir. What do you do?"
	prompt.select("") do |menu|
		menu.choice 'Get rid of all competition', -> {new_test.score += 10}
		menu.choice 'Work to place a lord that is easy to manipulate', -> {new_test.score += 8}
		menu.choice 'Arrange a vote', -> {new_test.score += 0}
		menu.choice 'Arrange a tournament', -> {new_test.score += 3}
	end
	new_test.save
	display_character_match(user)
	#happy_goodbye
end

#----------------------------------------------------------------------------#
#---------------------------- Questions--------------------------------------#
#----------------------------------------------------------------------------#

welcome_screen
create_user
