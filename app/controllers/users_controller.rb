
class UsersController < ApplicationController
 
  get "/users" do
    
    erb :'/users/view_all'
  end

end
