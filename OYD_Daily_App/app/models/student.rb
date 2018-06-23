class Student < ApplicationRecord
	belongs_to :school
	has_many :tests
	has_many :mlt_attendances

	def full_name
		first_name + " " + last_name
	end
end
