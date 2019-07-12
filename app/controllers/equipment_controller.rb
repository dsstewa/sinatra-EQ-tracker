class EquipmentController < ApplicationController

get '/equipment/new' do
 erb :'/new/new_equipment'

end



post '/equipment' do
@new_equipment = Equipment.create(params)
#Need to build this out
 
redirect "/equipment/#{@new_equipment.id}"
    
end

get '/equipment/:id' do 
    
    @equipment= Equipment.find_by_id(params[:id])
    
    erb :'/equipment/model'
      
    end



end
  