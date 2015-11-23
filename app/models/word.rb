class Word < ActiveRecord::Base
  before_create :add_letters
  
  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
  end

  def self.find_anagrams(string)
    #convert word to an array of letters
    letters = string.split(//)

    #create an array to store our anagrams
    combinations = []

    #loop through each letter in letters
    letters.each do |letter|
      #select the remaining letters
      remaining = letters.select {|char| char != letter }

      #create a new word by combining the letter + the remaining letters
      #add new word to anagrams array
      combinations << letter + remaining.join('')

      #create a new word by combining the letter + the reverse of the remaining letters
      #add new word to anagrams array
      combinations << letter + reverse_letters(remaining).join('')
    end

    anagrams = []
    #loop over each combo and check for word existence
    combinations.each do|word|
      if Word.find_by_text(word).present?
        anagrams << word
      end
    end

    #return anagrams array
    anagrams
  end

  def self.reverse_letters(letters)
    #create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)

    #loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end

    reversed_letters
  end
end