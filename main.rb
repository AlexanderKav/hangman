#require "lib/"
require 'json'

#File.open("google-10000-english-no-swears.txt", 'r') do |file|

  #puts file.read()
#end
lines = File.readlines("google-10000-english-no-swears.txt")
json = JSON.generate(lines)
puts json
#puts "Welcome to Hangman"