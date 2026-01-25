class Guess
  @@guess_attempts = 12
  def initialize(word)
    @word = word
    @length_of_word = word.length-1
    @guesses = []
    blank_slate
  end


  def is_guess_in_word?(letter)
    guess = false
    for i in 0..@length_of_word
      puts i 
      if @word[i] == letter
        @guesses[i] = letter
        guess = true
      end
    end
    guess
  end


  def attempt
    puts "Please choose a letter"
    letter_guess = gets.chomp
    if is_guess_in_word?(letter_guess)
      puts "Correct !!!"
      puts show_progress
    else
      @@guess_attempts -=1
      puts "Incorrect !!! You have #{@@guess_attempts} left"
    end
  end


  def show_progress
    puts @guesses.join(" ")
  end


  def incorrect_guesses()
    
  
  end

  
  def blank_slate
    @length_of_word.times do
      @guesses.push"_"
    end
  end



  def incorrect_letter
    
  end


end