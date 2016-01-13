get '/words' do 
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  @word = Word.new
  erb :"/words/new"
end

get '/words/:id/edit' do
  id = params[:id]
  @word = Word.find(id)
  erb :"/words/edit"
end

get '/words/:id' do
  id = params[:id]
  @word = Word.find(id)
  erb :"/words/show"
end

post '/words' do
  text = params[:text]
  begin
    all_letters(text)
    word = Word.create(text: params[:text])
    redirect "/words/#{word.id}"
  rescue Exception => error
    @error = error.message
    @word = Word.new
    erb :"/words/new"
  end
end

put '/words/:id' do
  id = params[:id]
  @word = Word.find(id)
  @word.text = params[:text]
  @word.save
  erb :"/words/show"
end

delete '/words/:id' do
  id = params[:id]
  @word = Word.find(id)
  @word.delete
  redirect "/words"
end

def all_letters(str)
    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
    # yield true for the empty string
    if str[/[a-zA-Z]+/]  != str
      raise Exception.new("Word must be letters only.")
    end
end