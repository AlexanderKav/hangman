class Guess
  @@guess_attempts = 12
  def initialize(word)
    @word = word.chomp
    @length_of_word = word.length-1
    @correct_guesses = []
    @guesses = []
    blank_slate
  end


  def is_guess_in_word?(letter)
    guess = false
    for i in 0..@length_of_word
      if @word[i] == letter
        @correct_guesses[i] = letter
        guess = true
      end
    end
    guess
  end


  def attempt
    puts "Please choose a letter: "
    letter_guess = gets.chomp
    letter_guess = letter_guess.downcase
    if is_guess_in_word?(letter_guess)
      puts "Correct !!!"
    else
      @@guess_attempts -=1
      @guesses.push(letter_guess)
      puts "Incorrect !!! You have #{@@guess_attempts} left"
    end
  end


  def show_progress
    puts @correct_guesses.join(" ")
    puts "\n"
    puts "Incorrect guess so far: #{@guesses.join(", ")}"
  end



  
  def blank_slate
    @length_of_word.times do
      @correct_guesses.push"_"
    end
  end

  def game_over?
    game_over = false
    if @@guess_attempts == 0
      game_over = true
      puts "You lose!!!"
    
    elsif @word == @correct_guesses.join("")
      game_over = true
      puts "You Win!!!"
    end
    game_over
  end


  def incorrect_letter
    
  end


end