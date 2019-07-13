
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
    if User.find_by(:username => params[:username])
        @error = "This username is unavaliable, please pick something else"
        erb :'/new/new_user'
    elsif params[:username].empty? || params[:email].empty? || params[:password].empty?
      @error = "Username, Email and password are required fields"
      erb :'/new/new_user'
    else
        @current_user.save
        session[:user_id] = @current_user.id
       redirect '/'
    end 
   end

  get '/users/signout' do
   session.clear
   redirect '/'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username]) 
     
    if !@user
      @error = "This account does not exist, please Create a new User Account"
      erb :login
    elsif @user.authenticate(params[:password])    
      session[:user_id] = @user.id
      redirect "/"
    else
      @error = "Please check your username and password agian"
      erb :login
     end
  end
end