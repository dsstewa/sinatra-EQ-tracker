
class UsersController < ApplicationController
 
  get "/users" do
    @users = User.all
    erb :'/users/view_all'
  end

end
