class CreateAllergiesUsersJoinTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :allergies_users, :id => false do |t|
      t.integer :allergy_id
      t.integer :user_id
    end

    add_index :allergies_users, [:allergy_id, :user_id]
  end

  def self.down
    drop_table :allergies_users
  end
end
