class ProjectController < ApplicationController

  get '/projects/error' do    #error splash page 
    erb :'/projects/error'
  end


  get '/projects/new' do    #creates a new project, checks to verify the user is logged in first
     if logged_in? 
       erb :'/new/new_project' 
     else 
      erb :login
     end
  end
  
  patch '/projects/:id/edit' do       #dynamic page for editing projects based on the project ID
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

  get '/projects/:id' do     #page for viewing the project information, agian checks to verify user is logged in  
   if logged_in? 
    @project= Project.find_by_id(params[:id])
    erb :'projects/project'
   else
    redirect '/'
   end 
  end


  post '/projects' do    #post request for creating a new project, all fields must be filled in or it kicks the user an error
   
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

delete '/projects/:id/delete' do   #delete page for deleting a project, verifies user is the owner before deliting, if not kicks an error d 
  
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
  