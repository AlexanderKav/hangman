require_relative 'lib/guess'
require_relative 'lib/file_reader'

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
end