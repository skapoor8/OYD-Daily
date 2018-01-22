class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.text :school_name
      t.integer :main_ins_id
      t.integer :school_region
      t.text :street
      t.text :street2
      t.text :city
      t.text :state
      t.text :postal_code
      t.text :country
      t.text :email
      t.text :school_phone
      t.integer :status
      t.integer :standing

      t.timestamps
    end
  end
end
