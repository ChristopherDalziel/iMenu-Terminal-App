userInput = gets.chomp

draw =[]
computer_won = []
you_won = []

    def computerRand
        computerChoice = rand(1..10)
        if computerChoice < 4
            computerChoice = 'rock'
        elsif computerChoice > 4 && computerChoice <= 7
            computerChoice = "paper"
        else
            computerChoice = "scissors"
        end
        puts "The computer: " + computerChoice
    end

    def compare(choiceOne, choiceTwo)
        if choiceOne == choiceTwo
            return 'its a tie'
            draw << 1
        elsif
            choiceOne = 'rock' && choiceTwo = 'paper'
            return 'paper wins'
        elsif 
            choiceOne = 'paper' && choiceTwo = 'rock'
            return 'paper wins'
        elsif choiceOne = 'scissors' && choiceTwo = 'rock'
            return 'rock wins'
        else 
            return 'scissors wins'
    end
end



    p compare(userInput, computerRand)

# userInput2 = gets.chomp

# p compare(userInput, userInput2)




