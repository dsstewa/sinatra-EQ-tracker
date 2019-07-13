
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
      redirect to '/error'
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
     
    if @user
      redirect to "/users/new"
    elsif @user.authenticate(params[:password])    
      session[:user_id] = @user.id
      redirect "/"
    
     end
  end
end