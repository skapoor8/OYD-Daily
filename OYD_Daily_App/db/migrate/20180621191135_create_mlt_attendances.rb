class CreateMltAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :mlt_attendances do |t|
      t.references :student, foreign_key: true
      t.date :mlt_date
      t.integer :course
      t.integer :lesson

      t.timestamps
    end
  end
end
