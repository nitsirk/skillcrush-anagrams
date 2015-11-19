get '/' do
  erb :index
end

post '/' do
  word = params[:word]
  if valid_input?(word)
    redirect "/anagrams/#{word}"
  else
    @error = "Please enter 3 letters or less."
    erb :index
  end
end

get '/anagrams/:word' do
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
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

def valid_input?(input)
  if three_letters?(input) && distinct_letters?(input)
    true
  else
    false
  end
end