class CreatePowerOfAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :power_of_attorneys do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.string :state
      t.string :city
      t.integer :zip_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
