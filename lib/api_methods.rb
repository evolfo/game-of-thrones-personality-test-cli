require 'net/http'
require 'open-uri'
require 'json'

#Accessing the A song of ice and fire API to get the character's name, title, 
# house and coat of arms, and scraping the GoT Wiki to get their description

def char_info(character, char_with_underscore)
	api_id = Character.characters[character.split.first]

	uri = URI.parse("https://anapioficeandfire.com/api/characters/#{api_id}")
	response = Net::HTTP.get_response(uri)
	character_hash = JSON.parse(response.body)

	puts "Name: #{character_hash["name"]}"
	puts "Title: #{character_hash["titles"][0]}"
	house_page_url = character_hash["allegiances"][0]

	uri = URI.parse(house_page_url)
	response = Net::HTTP.get_response(uri)
	house_response = JSON.parse(response.body)

	puts "House: #{house_response["name"]}"
	puts "Coat of Arms: #{house_response["coatOfArms"]}"

	html = open("https://gameofthrones.fandom.com/wiki/#{char_with_underscore}")
	doc = Nokogiri::HTML(html)
	puts "Season(s): #{doc.css("div[data-source='Season'] a").text.split(//).join(", ")}"
	puts "Description: #{char_description(char_with_underscore)}"
end
