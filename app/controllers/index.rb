get '/' do
  # Look in app/views/index.erb
  erb :index
end

not_found do
  redirect("/")
end
