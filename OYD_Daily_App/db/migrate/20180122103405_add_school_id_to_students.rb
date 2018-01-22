class AddSchoolIdToStudents < ActiveRecord::Migration[5.1]
  def change
  	add_reference :students, :school, index: true
  end
end
