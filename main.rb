#require "lib/"
#require 'json'

#File.open("google-10000-english-no-swears.txt", 'r') do |file|

  #puts file.read()
#end
lines = File.readlines("google-10000-english-no-swears.txt")
#json = JSON.generate(lines)
words = []
for line in lines do
  words.push(line)
end
#puts json

random_word = words.sample()

puts random_word

guess_length = random_word.length-1

guess_length.times do
puts "_"
end
#puts "Welcome to Hangman"