class CreateEmergencyContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :name1
      t.string :phone1
      t.text :address1
      t.string :state1
      t.string :city1
      t.integer :zip_code1
      t.string :name2
      t.string :phone2
      t.text :address2
      t.string :state2
      t.string :city2
      t.integer :zip_code2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
