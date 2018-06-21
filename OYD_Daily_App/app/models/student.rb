class Student < ApplicationRecord
	belongs_to :school
	has_many :tests

	def full_name
		first_name + " " + last_name
	end
end
