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
        # @payment
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

menuItems = []


burger_info.each_with_index do |array, index|
    menuItems << Menu_item.new(burger_info[index][0], burger_info[index][1], burger_info[index][2])
end

menuItems.each_with_index do |item, index|
    puts "#{index + 1}. #{item.name} $#{item.price}"
end

puts
puts 'Do you want to know more about any of these options?'
print "> "
# Function works, shows all descriptions for all burgers
# userInput = gets.strip.downcase
# if userInput == 'yes'
#     menuItems.each_with_index do |item, index|
#         puts "#{index + 1}. #{item.description}"
#     end
# end

running = true
while running == true do
    userInput = gets.chomp.downcase
    if userInput == 'no'
        running = false
        break
    elsif userInput == 'yes'
        running = true
        puts "Awesome, enter the number you'd like to know more about."
    userInput2 = gets.chomp.to_i-1
    puts menuItems[userInput2].description
    puts 'Did you want to know more about anything else?'
    end
end



order = []

puts
puts "Time to make an order!"
puts "First off, what's your name?"
print "> "
userName = gets.chomp
userName = Customer.new(userName)
puts
puts "Awesome #{userName.name}, What would you like to order?"
puts "Input the number of the Burger you'd like below"
print "> "
userOrder = gets.chomp.to_i-1
selection = menuItems[userOrder]
order << selection

p "Thanks #{userName.name}! You ordered the #{selection.name} and it costs $#{selection.price} Please make your payment now by typing in an amount" 
print "> "


userPayment = 0
while userPayment == 0
    puts "Enter an amount"
    userPayment = gets.chomp.to_i

    if userPayment == selection.price.to_i
        puts "Thank you! Order Complete"
    elsif userPayment < selection.price.to_i
        owed = selection.price.to_i - userPayment
        puts "I'm sorry you entered the incorrect amount by $#{owed} please try again"
        userPayment = 0
    elsif userPayment > selection.price.to_i
        change = userPayment - selection.price.to_i
        puts "Here is your change of $#{change}"
    end
end


File.open('output.csv', 'a+') do |line|
    line << "#{selection.name} is #{selection.price}" 
end