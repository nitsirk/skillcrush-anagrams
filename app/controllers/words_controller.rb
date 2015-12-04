get '/words' do 
  @words = Word.all
  erb :"/words/index"
end

get '/words/:id' do
  id = params[:id]
  @word = Word.find(id)
  erb :"/words/show"
end
