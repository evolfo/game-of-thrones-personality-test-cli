require_relative '../config/environment'
require_relative '../lib/character.rb'
require 'tty-prompt'
require 'tty-table'


puts "Welcome to the Game of Thrones character quiz. Take this quiz to see which character you are!"


def user_check(username)
	User.find_or_create_by(name: username)
end

def welcome_screen
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
                                                         /_/               "
	sleep(3)
	system "clear"
end

def prompt
	TTY::Prompt.new
end

def create_user
	puts "Please enter your name:"
	name = gets.chomp
	user = user_check(name)
	user = User.create(name: name)
	main_menu(user)
end
#------------------------------Main-Menu---------------------------------------
def main_menu(user)
	prompt = TTY::Prompt.new
	prompt.select("Choose something") do |menu|
		menu.choice 'Take The quiz!', -> {question1(user)}
		menu.choice 'View The List Of All Characters', -> {character_list}
		menu.choice 'View Your Quiz history', -> {quiz_history(user)}
		menu.choice 'Update User-Name', -> {update_user(user)}
		menu.choice 'Delete Quiz history', -> {delete_user_history(user)}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu(user)
end
#------------------------------Methods---------------------------------------
def character_list
	GotCharacter.all.each do |character|
		puts character.name
	end
end

def exit_app
	exit
end

def update_user(user)
	puts "Please type in your new username"
	answer = gets.chomp
	User.update(user.id, :name => name, :name => answer)
	puts "Your new user-name is #{answer}"
end

def delete_user_history(user)
	Test.where(user_id: user.id).destroy_all
	puts 'Your history has been deleted!!'
	user.tests.clear
end

def quiz_history(user)
	#binding.pry
	user.tests
	user.tests.each do |test|
		puts test.score
	end
end

def display_character_match(user, new_test)
	main_menu(user)
end


#----------------------questions----------------------------------------------
def question1(user)
	new_test = Test.create(user_id: user.id, character_id: nil, score: 0)
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
	#question5(user, new_test)
	display_character_match(user, new_test)
end


#----------------------questions-----------------------------------------------

welcome_screen
create_user
