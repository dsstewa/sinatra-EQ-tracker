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
    @project= Project.find_by_id(params[:id])
    


    erb :'projects/project'
    end


  post '/projects' do 
   @new_project = Project.new(params)
   @new_project.user = current_user 
   @new_project.save
   
   redirect "/projects/#{@new_project.id}"
  end

delete '/projects/:id/delete' do 
  
  if session[:user_id] == current_user.id
  @project = Project.find_by_id(params[:id])
  @project.delete
  redirect to '/'
  else
    redirect to "/projects/error"
  end
  
end


   
  end
  