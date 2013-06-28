get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/create_post' do
  @post = Post.new
  erb :create_post
end

post '/create_post' do
  puts params[:title]
  puts params[:body]
  puts params[:tag_names]

  @post = Post.new( { :title => params[:title],
                         :body  => params[:body],
                         :tag_names => params[:tag_names] }
                     )
  if @post.save
    redirect("/post/#{@post.id}")
  else
    erb :create_post
  end
end

get '/delete_post/:id' do
  Post.delete(params[:id])
  redirect("/")
end

get '/edit_post/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/edit_post/:id' do
  @post = Post.find(params[:id])
  if @post.update_attributes( { :title => params[:title],
                                :body => params[:body],
                                :tag_names => params[:tag_names] })
    redirect("/post/#{@post.id}")
  else
    erb :edit_post
  end
end
