get '/words' do 
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  erb :"/words/new"
end

get '/words/:id' do
  id = params[:id]
  @word = Word.find(id)
  erb :"/words/show"
end

post '/words' do
  word = Word.create(text: params[:text])
  redirect "/words/#{word.id}"
end