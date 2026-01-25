require_relative 'lib/guess'
require_relative 'lib/file_reader'

lines = File.readlines("words.txt")
file_reader = FileReader.new(lines)

file_reader.read_file


random_word =  file_reader.pick_random_word

puts random_word


guess_length = random_word.length-1

guesses = []

guess_length.times do
  guesses.push"_"
end

puts guesses.join(" ")
#puts "Welcome to Hangman"