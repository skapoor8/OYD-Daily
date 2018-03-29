class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.integer :school_id
      t.datetime :date_visited
      t.text :first_name
      t.text :last_name
      t.integer :age
      t.datetime :birthdate
      t.text :class_group
      t.text :street
      t.text :street2
      t.text :city
      t.text :state
      t.text :postal_code
      t.text :country
      t.text :email
      t.text :mobile_phone
      t.text :home_phone
      t.text :parental_contact
      t.text :how_found
      t.text :occupation
      t.text :interest
      t.text :body_issues
      t.text :notes

      t.timestamps
    end
  end
end
