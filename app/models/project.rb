class Project < ActiveRecord::Base

has_many :equipments
has_many :users


end