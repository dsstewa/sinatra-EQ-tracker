
class UsersController < ApplicationController
 
  get "/users" do
    @users = User.all
    erb :'/users/view_all'
   end

   get '/users/new' do 
    erb :'/new/new_user'
   end

   post '/users/signup' do 
    @current_user = User.new(params)
    @current_user.save
    session[:user_id] = @current_user.id
    
    redirect '/'

   end

  get '/users/signout' do
   session.clear
   redirect '/'
  end

  post '/login' do
  binding.pry
  #stopped here, need to get this to work

  end


end