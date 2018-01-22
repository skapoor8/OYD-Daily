class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :oyd_id
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :nick_name
      t.integer :age
      t.date :birth_date
      t.text :status
      t.text :drop_reason
      t.text :position
      t.text :rank
      t.text :next_rank
      t.text :class_group
      t.text :street
      t.text :street2
      t.text :city
      t.text :postal_code
      t.text :country
      t.text :email
      t.text :mobile_phone
      t.text :home_phone
      t.text :parental_contact
      t.text :occupation
      t.text :how_found
      t.integer :intern_points
      t.date :last_test_date
      t.date :next_test_date
      t.text :facebook
      t.text :instagram
      t.text :twitter

      t.timestamps
    end
  end
end
