class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.date :dob
      t.string :gender
      t.text :address
      t.string :state
      t.string :city
      t.integer :zip_code
      t.string :cell_phone
      t.string :home_phone
      t.string :office_phone
      t.string :fax
      t.string :code_status
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
