require 'csv'

class CreateMoreWords < ActiveRecord::Migration
  def change
    csv_text = File.read('db/dictionary2.csv')
    dictionary_words = CSV.parse(csv_text)
    dictionary_words.each do |row|
      Word.create!(text: row[0])
    end
  end
end
