class CreateDiseasesUsersJoinTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :diseases_users, :id => false do |t|
      t.integer :disease_id
      t.integer :user_id
    end

    add_index :diseases_users, [:disease_id, :user_id]
  end

  def self.down
    drop_table :diseases_users
  end
end
