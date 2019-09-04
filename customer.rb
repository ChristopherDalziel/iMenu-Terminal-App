class Menu_item

    attr_accessor :name
    attr_accessor :price
    attr_accessor :description

    # @@instance_count = 0

    def initialize(name, description, price)
        @name = name
        @description = description
        @price = price

        # @@instance_count += 1
    end

    # def to_s
    #     "Name: #{@name} Description: #{@description} Price: $#{@price}"
    # end

    # def self.instance_count
    #     @@instance_count
    # end
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

puts 'Do you want to know more about any of these options?'
print "> "
userInput = gets.chomp
if userInput == 'yes'
    menuItems.each_with_index do |item, index|
        puts "#{index + 1}. #{item.description}"
    else
        userInput == 'no'
    end
end

order = []

# def customerOrder
#     puts "Time to make an order, first off whats your name?"
#     print "> "
#     userName = gets.chomp
#     puts "Awesome #{userName}, What would you like to order?"
#     puts "Input the number of the Burger you'd like below"
#     userOrder = gets.chomp.to_i
#     order << menuItems[userOrder]
# end

# p customerOrder

puts "Time to make an order!"
print "First off, what's your name? > "
userName = gets.chomp
userName = Customer.new(userName)
puts "Awesome #{userName} What would you like to order?"
userOrder = gets.chomp.to_i 
selection = menuItems[userOrder]
order << selection

p order

p "Thanks just the #{menuItems.name} today? that will be #{menuItems.price}"

# menuItems.each_with_index do |index|
#     puts "#{index}"
#     puts menuItems
# end


# puts "Lets make an order!"
# print "> "

# userInput = gets.chomp.to_i
# if userInput > 0 && userInput <= menuItems.length
#     puts menuItems[userInput]
# else
#     puts "you've selected an incorrect number"
# end









# split_again = []

# items.each_with_index do |each_item|
#     split_again << Menu_items.new(each_item[1], each_item[2], each_item[3], each_item[4])
# end


# puts split_again

# test = Menu_items.new(items[1], items[2], items[3], items[4])

# p test



