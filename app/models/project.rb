class Project < ActiveRecord::Base

has_many :equipments
belongs_to :users


end