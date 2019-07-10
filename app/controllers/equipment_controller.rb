class EquipmentController < ApplicationController

get '/equipment/new' do
 erb :'/new/new_equipment'

end

post '/equipment' do
@new_equipment = Equipment.create(params)
#Need to build this out
    binding.pry
end



end
  