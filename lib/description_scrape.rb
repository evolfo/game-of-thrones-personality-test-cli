require 'nokogiri'
require 'open-uri'
require 'pry'


#Getting the description of the character from the awoiaf Wiki page. 

def char_description(character)
	html = open("https://awoiaf.westeros.org/index.php/#{character}")
	doc = Nokogiri::HTML(html)
	if doc.css("div.hatnote:first-child").empty? #|| doc.css(".mw-parser-output .hatnote:nth-child(2)").empty?
		description = doc.css(".mw-parser-output > p:nth-child(2)").text.gsub!(/[^A-Za-z ,.]/,'')
	else 
		description = doc.css(".mw-parser-output > p:nth-child(3)").text.gsub!(/[^A-Za-z ,.]/,'')
	end

	if character == "Walder_Frey"
		description = doc.css(".mw-parser-output > p:nth-child(3)").text.gsub!(/[^A-Za-z ,.]/,'')
	end

	if character == "Viserys_Targaryen"
		description = doc.css(".mw-parser-output > p:nth-child(3)").text.gsub!(/[^A-Za-z ,.]/,'')
	end

	if character == "Tywin_Lannister"
		description = doc.css(".mw-parser-output > p:nth-child(2)").text.gsub!(/[^A-Za-z ,.]/,'')
	end
	description
end

#Checking to see if the character is still alive in the series by scraping the gameofthrones fandom site.

def char_alive?(user, result, character)
	html = open("https://gameofthrones.fandom.com/wiki/#{character}")
	doc = Nokogiri::HTML(html)
	words = doc.css(".pi-item .pi-font a").text.split /(?=[A-Z])/
	if words.include?("Alive")
		puts "You are still alive!"
	else
		death = doc.css("div[data-source='Death'] .pi-font").text.split /(?=[A-Z])/
		puts "You died in #{death.join(' ').gsub(/ +/, ' ')}"
	end
	end_menu(user, result)
end
