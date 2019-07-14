
class UsersController < ApplicationController
 
  # get "/users" do    #future implmentation of single page to display all registered users. 
  #   @users = User.all
  #   erb :'/users/view_all'
  #  end

   get '/users/new' do    #creates new user, do not have to be logged in for this
    erb :'/new/new_user'
   end

   post '/users/signup' do   #post request from new user sign up. Checks to make sure username is not already take, verifies all fields are filled out
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

  get '/users/signout' do    #signes the user out by clearing the session and redirecting them to the home page
   session.clear
   redirect '/'
  end

  post '/login' do   #login page checks to see if the user account exists, if accoutn does exists checks the username and password 
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