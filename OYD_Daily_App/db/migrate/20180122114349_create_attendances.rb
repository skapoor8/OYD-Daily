class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :student, foreign_key: true
      t.datetime :when

      t.timestamps
    end
  end
end
