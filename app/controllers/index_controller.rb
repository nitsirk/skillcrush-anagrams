get '/' do
  erb :index
end

post '/' do
  word = params[:word]
  begin
    valid_input(word)
    redirect "/anagrams/#{word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end

get '/anagrams/:word' do
  @word = params[:word]
  word_array = @word.chars.sort
  alphabetized_string = word_array.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

def three_letters?(input)
  #if input has 3 or less chars, return true
  if input.length <= 3
    return true
  else
    return false
  end
end

def distinct_letters?(input)
  letter_array = input.chars
  unique_letters = letter_array.uniq
  if unique_letters.length < letter_array.length
    false
  else
    true
  end
end

def valid_input(input)
  if input.length > 3
    raise Exception.new("Word must be less than or equal to 3 characters.")
  end
end