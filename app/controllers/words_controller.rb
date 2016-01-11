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
  word = Word.create(text: params[:text])
  redirect "/words/#{word.id}"
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