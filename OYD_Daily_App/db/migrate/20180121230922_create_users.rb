class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :oyd_id
      t.integer :access_level
      t.text :first_name
      t.text :last_name
      t.text :def_school
      t.text :def_region
      t.text :def_nat_area
      t.text :auth_schools

      t.timestamps
    end
  end
end
