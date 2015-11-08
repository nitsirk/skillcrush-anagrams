require_relative 'reverse_letters'
require 'pp'

def find_anagram(word)
  characters = word.split('')
  #make an array
  word_list = []
  #put each combo of letters into array
  characters.each do |current_character|
    #puts "current_character is: " + current_character

    other_letters = characters.select do |letter|
      letter != current_character
    end

    #puts "other_letters is: "
    #pp other_letters
    
    word_list.push(current_character + other_letters[0] + other_letters[1])
    word_list.push(current_character + other_letters[1] + other_letters[0])

    #puts ''
  end
  #return array
  #puts "word_list is: "
  #pp word_list
  return word_list
end



pp find_anagram('abc')