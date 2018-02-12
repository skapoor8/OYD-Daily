class CreateNewStudentEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :new_student_events do |t|
      t.integer :student_id
      t.integer :oyd_id
      t.datetime :signup_date

      t.timestamps
    end
  end
end
