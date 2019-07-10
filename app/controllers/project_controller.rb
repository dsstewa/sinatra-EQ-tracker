class ProjectController < ApplicationController

  
  get '/projects/new' do
 
    erb :'/new/new_project' 
  
  end
  
  
  get '/projects/:id' do 
    @project= Project.find_by_id(params[:id])
    binding.pry
    erb :'projects/project'
    end


  post '/projects' do 
  
   @new_project = Project.create(params)
  binding.pry

  end


   
  end
  