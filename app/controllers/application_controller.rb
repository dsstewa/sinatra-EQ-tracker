require './config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do    #Load configuration files, enable HTTP sessions and set the session secret
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_equipmentapp"
  end

  get "/" do             #Loads initial splash pages, requires user to be logged in
    @projects = Project.all
    @users  = User.all
    
    if logged_in?
      erb :home_page
    else
      erb :login
    end
    
  end





  helpers do      #Helper methods for logged in and the current user session
    
    def logged_in?
      !!current_user
    end 

    def current_user
      if session[:user_id]
        @current_user = User.find_by_id(session[:user_id]) 
      end 
    end 
  end  


end
