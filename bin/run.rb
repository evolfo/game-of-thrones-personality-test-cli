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
	sleep(4)
	system "clear"
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
		menu.choice 'View the list of all characters', -> {character_list}
		menu.choice 'Update User-Name', -> {update_user}
		menu.choice 'Delete User', -> {delete_user(user)}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu
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

def update_user
end

def delete_user(user)
	User.where(id: user.id).destroy(user.tests)
	puts 'User has been deleted!!'
	binding.pry
	sleep(2)
	system 'clear'
end
----------------------questions----------------------------------------------

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


----------------------questions-----------------------------------------------

welcome_screen
create_user
