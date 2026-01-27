require_relative 'lib/guess'
require_relative 'lib/file_reader'
require 'json'


if File.exist?("saved_games")
  puts "Would you like to continue a previous game?(Y/N)"
  load_previous_saves = gets.chomp
  if load_previous_saves.downcase == 'y'
      json_text = File.read("saved_games")
      data = JSON.parse(json_text)
      data.each do |item|
        puts item["save_file_number"]
      end
      #puts data["save_file_number"]
  end
end

  lines = File.readlines("words.txt")
  file_reader = FileReader.new(lines)
  file_reader.read_file
  random_word =  file_reader.pick_random_word
  puts random_word
  guess = Guess.new(random_word)

while guess.game_over? == false
  puts "\n"
  puts "========================="
  guess.attempt
  puts "\n"
  guess.show_progress
  puts "========================="
  puts "\n"

  puts "Would you like to save your progress? (Y/N): "
  save = gets.chomp
  if save.downcase == "y"
    guess_string = guess.to_object
    path = "saved_games"
    array = 
    if File.exist?(path) && File.size?(path)
      JSON.parse(File.read(path))
    else
      []
    end
    #File.write("saved_games", guess_string)
    array.push(guess_string)
    File.write(path,JSON.pretty_generate(array))
    break
  end
end