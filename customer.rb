
require 'argv'
require 'colorize'
require 'artii'

ARTII = Artii::Base.new font: 'big'
puts `clear`
puts 'Welcome to..'
#Enter your buisness name in between the brackets below in replacement of ('Burgerland') Example: ('McDonalds').
puts ARTII.asciify('BurgerLand')
puts 'Powered by iMenu'
puts '---------------------------------------------------------'
puts

require_relative 'iMenu_Classes.rb'
MENU = 'menu.csv'
OUTPUT = 'output.csv'

headings = []
burger_info = []

File.open(MENU, 'r').each_with_index do |line, index|
  unless line.empty?
    if index == 0
      headings << line.split(',')
    else
      burger_info << line.split(',')
    end
  end
end

def handle_exit(burger_info)
  puts
  puts 'Would you like to enter another customers order? (Yes/No)'
  print '> '
  customerQuestion = STDIN.gets.chomp.downcase
  if customerQuestion == 'yes'
    puts `clear`
    return menu(burger_info)
  elsif customerQuestion == 'no'
    puts
    puts 'Thanks for using!'.colorize(:green)
    exit
  else
    puts 'Sorry that was an incorrect input, please try again.'.colorize(:red)
    handle_exit(burger_info)
    exit
  end
end

def more_information_about_burgers(_burger_info, menuItems)
  menuItems.each_with_index do |item, index|
    puts "#{index + 1}. #{item.name} $#{item.price}"
  end

  puts
  puts 'Do you want to know more about any of these options? (Yes/No)'
  print '> '

  running = true
  while running == true
    userInput = STDIN.gets.chomp.downcase
    if userInput == 'no'
      running = false
      break
    elsif userInput == 'yes'
      running = true
      puts
      puts "Awesome, enter the number of the burger you'd like to know more about."
      print '> '
      userInput2 = STDIN.gets.chomp.to_i - 1
      if userInput2 == -1 || userInput2 >= menuItems.length
        puts
        puts 'Error, incorrect number input, would you like to try again?'.colorize(:red)
        print '> '.colorize(:red)
      else
        puts menuItems[userInput2].description
        puts
        puts 'Did you want to know more about anything else?'
      end
    else
      puts 'Incorrect input, please try again with (Yes/No)'.colorize(:red)
    end
  end
end

def menu(burger_info)
  menuItems = []
  burger_info.each_with_index do |_array, index|
    menuItems << Menu_item.new(burger_info[index][0], burger_info[index][1], burger_info[index][2])
  end

  if ARGV[0] == 'show_menu'
    more_information_about_burgers(burger_info, menuItems)
  end
  @order = []
  puts
  puts 'Okay, Time to make an order!'
  puts "First off, what's your name?"
  print '> '
  userName = STDIN.gets.chomp
  userName = Customer.new(userName)
  puts
  puts "Awesome #{userName.name.capitalize}, What would you like to order?"
  puts "Input the number of the Burger you'd like below"
  print '> '

  # broken
  # while user_is_ordering = true
  #   userOrder = STDIN.gets.chomp.to_i - 1
  #     if userOrder == -1 || userOrder >= menuItems.length
  #       selection = menuItems[userOrder]
  #       puts
  #       puts "Thanks #{userName.name}! You ordered the #{selection.name}, and it costs $#{selection.price}."
  #       user_is_ordering = false
  #     else
  #       puts
  #       puts "You've entered an incorrect number, Please try again.".colorize(:red)
  #       print "> "
  #   end
  # end

  user_is_ordering = true
  while user_is_ordering
    userOrder = STDIN.gets.chomp.to_i - 1
    if userOrder <= menuItems.length
      selection = menuItems[userOrder]
      puts
      puts "Thanks #{userName.name.capitalize}! You ordered the #{selection.name}, and it costs $#{selection.price}."
      user_is_ordering = false
    else
      puts
      puts "You've entered an incorrect number, Please try again.".colorize(:red)
      print '> '
  end
  end

  @order << selection

  userPayment = 0
  while userPayment == 0
    puts
    puts 'Please enter the amount owed below'
    print '> '
    userPayment = STDIN.gets.chomp.to_i

    if userPayment == selection.price.to_i
      puts
      puts 'Thank you! Order Complete'.colorize(:green)
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

  File.open(OUTPUT, 'a+') do |line|
    line << "#{selection.name} Cost:$ #{selection.price}"
  end
  handle_exit(burger_info)
end

menu(burger_info)
