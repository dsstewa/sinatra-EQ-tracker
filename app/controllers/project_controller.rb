class ProjectController < ApplicationController

  get '/projects/error' do
    erb :'/projects/error'
  end


  get '/projects/new' do
 
    erb :'/new/new_project' 
  
  end
  
  patch '/projects/:id/edit' do 
    @project = Project.find_by_id(params[:id])
    
    if session[:user_id] == @project.user_id
    
    @project.name = params[:name]
    @project.location = params[:location]
    @project.duration = params[:duration]
    @project.save
    else
      redirect to "/projects/error"

    end 
    redirect to "/"

  end

  get '/projects/:id' do 
   if logged_in? 
    @project= Project.find_by_id(params[:id])
    erb :'projects/project'
   else
    redirect '/'
   end 
  end


  post '/projects' do 
   
    if params[:name].empty? || params[:location].empty? || params[:duration].empty?
       @error = "Project Name, Location and Duration must be filled out"
       erb :'/new/new_project' 
    else
     @new_project = Project.new(params)
     @new_project.user = current_user 
     @new_project.save
     redirect "/projects/#{@new_project.id}"
    end
   
  end

delete '/projects/:id/delete' do 
  
  @project = Project.find_by_id(params[:id])
  if session[:user_id] == @project.user.id
    
    @project.delete
    redirect to '/'
  else
    @error = "You are not the creater of this project and therfore can not delete"
    @error2 = "Please contact the user:#{User.find_by_id(@project.user_id).username} at the email:#{User.find_by_id(@project.user_id).email}"
    
    erb :"projects/error_delete"
  end
  
end


   
  end
  