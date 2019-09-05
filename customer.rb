require "argv"
require "colorize"
require "artii"

puts "Welcome to #{ARGV[0]}"

ARTII = Artii::Base.new :font => 'big'
 puts ARTII.asciify("Burgs")

puts "-----------------------------------------------------"

class Menu_item
	
	attr_accessor :name
	attr_accessor :price
	attr_accessor :description
	
	def initialize(name, description, price)
		@name = name
		@description = description
		@price = price
	end
	
	
end

class Customer
	
	attr_accessor :name
	
	def initialize(name)
		@name = name
		@order = []
	end
	
end


MENU = "menu.csv"

headings = []
burger_info = []

File.open(MENU, "r").each_with_index do |line, index|
	if line.length > 0 
		if index == 0
			headings << line.split(",")
		else
			burger_info << line.split(",")
		end
	end
end


def menu(burger_info)
	customer = true
	while customer == true do
		menuItems = []
		
		
		burger_info.each_with_index do |array, index|
			menuItems << Menu_item.new(burger_info[index][0], burger_info[index][1], burger_info[index][2])
		end
		
		menuItems.each_with_index do |item, index|
			puts "#{index + 1}. #{item.name} $#{item.price}"
		end
		
		puts
		puts 'Do you want to know more about any of these options? (Yes/No)'
		print "> "
		
		running = true
		while running == true do
			userInput = STDIN.gets.chomp.downcase
			if userInput == 'no'
				running = false
				break
			elsif userInput == 'yes'
				running = true
				puts
				puts "Awesome, enter the number of the burger you'd like to know more about."
				print "> "
				userInput2 = STDIN.gets.chomp.to_i-1
				if userInput2 <= menuItems.length
				puts menuItems[userInput2].description
				puts
				puts 'Did you want to know more about anything else?'
				elsif userInput2 > menuItems.length
					puts
					puts "Error, incorrect number input, would you like to try again?"
					print "> "
				end
			else
				puts "Incorrect input, please try again with (Yes/No)".colorize(:red)
			end
		end
		
		
		@order = []
		
		puts
		puts "Okay, Time to make an order!"
		puts "First off, what's your name?"
		print "> "
		userName = STDIN.gets.chomp
		userName = Customer.new(userName)
		puts
		puts "Awesome #{userName.name}, What would you like to order?"
		puts "Input the number of the Burger you'd like below"
		print "> "

		userOrder = 0
		while userOrder == 0
			userOrder = STDIN.gets.chomp.to_i-1
				if userOrder <= menuItems.length
					selection = menuItems[userOrder]
					puts 
					puts "Thanks #{userName.name}! You ordered the #{selection.name} and it costs $#{selection.price}."
				else
					puts
					puts "You've entered an incorrect number, Please try again.".colorize(:red)
					print "> "
				userOrder = 0	
			end
		end
		
		@order << selection
		

		userPayment = 0
		while userPayment == 0
			puts
			puts "Please enter the amount owed below"
			print "> "
			userPayment = STDIN.gets.chomp.to_i
			
			if userPayment == selection.price.to_i
				puts
				puts "Thank you! Order Complete".colorize(:green)
			elsif userPayment < selection.price.to_i
				owed = selection.price.to_i - userPayment
				puts
				puts "I'm sorry you entered the incorrect amount by $#{owed} please try again".colorize(:red)
				puts
				userPayment = 0
			elsif userPayment > selection.price.to_i
				change = userPayment - selection.price.to_i
				puts
				puts "Here is your change of $#{change}"
			end
		end
		

		File.open('output.csv', 'a+') do |line|
			line << "#{selection.name} Cost:$ #{selection.price}" 
		end
		
		puts
		puts "Would you like to enter another customers order? (Yes/No)"
		print "> "
		
		customerQuestion = STDIN.gets.chomp.downcase
		if customerQuestion == 'yes'
			puts `clear`
			menu(burger_info)
		else
			customerQuestion == 'no'
			puts
			puts "Thanks for using"
			puts
			customer == false
			break
		end
	end
end

menu(burger_info)