require_relative 'lib/guess'
require_relative 'lib/file_reader'
require 'json'

def reading_random_word_from_file
  file_reader = FileReader.new(File.readlines("words.txt"))
  file_reader.read_file
  random_word =  file_reader.pick_random_word
  puts random_word
  guess = Guess.new(random_word)
  guess
end


if File.exist?("saved_games")
  puts "Would you like to continue a previous game?(Y/N)"
  load_previous_saves = gets.chomp
  if load_previous_saves.downcase == 'y'
      json_text = File.read("saved_games")
      data = JSON.parse(json_text)
      index =1
      data.each do |item|
        puts "========================="
        puts "save file ##{index}"
        p item["correct_guesses"].join(" ")
        puts "Attempts left: #{item["guesses_left"]}"
        puts "Incorrect guesses: #{item["incorrect_guesses"]}"
        index+=1
        puts "========================="
        puts "\n"
      end
      puts "Which save file number would you like to continue?"
      save_file_number = gets.chomp
      save_file_number = save_file_number.to_i
      data = data[save_file_number-1]
      guess = Guess.new(data["word"], data["guesses_left"], data["correct_guesses"], data["incorrect_guesses"])
    else  
        guess =reading_random_word_from_file
    end
else 
    guess = reading_random_word_from_file
end


loop do
  puts "\n"
  puts "========================="
  guess.attempt
  puts "\n"
  guess.show_progress
  puts "========================="
  puts "\n"
  if guess.game_over? == true
    break
  end

  puts "Would you like to save your progress? (Y/N): "
  save = gets.chomp
  if save.downcase == "y"
    guess_string = guess.to_object.transform_keys(&:to_s)
    #guess_string = guess.to_object
    path = "saved_games"
    array = if File.exist?(path) && File.size?(path)
              JSON.parse(File.read(path))
            else
                []
            end
    updated = false
    array.each do|item|
        if item["word"].to_s.strip.downcase == guess_string["word"].to_s.strip.downcase
            item["guesses_left"] = guess_string["guesses_left"]
            item["correct_guesses"] = guess_string["correct_guesses"]
            item["incorrect_guesses"] = guess_string["incorrect_guesses"]
            updated = true
            break
        end
      end

    if updated == true
      array.push(guess_string)
    end

    File.write(path,JSON.pretty_generate(array))
    break
  end
end
