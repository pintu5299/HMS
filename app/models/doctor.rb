class Doctor < ApplicationRecord
	belongs_to :user
	has_many :appointments
	has_many :patients, through: :appointments 

	has_one_attached :image 
end
