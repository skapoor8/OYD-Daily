class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.references :student, foreign_key: true
      t.integer :oyd_id
      t.date :test_date
      t.string :rank_tested
      t.boolean :pass_fail

      t.timestamps
    end
  end
end
