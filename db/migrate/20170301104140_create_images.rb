class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :user, foreign_key: true
      t.string :file
      t.string :tag

      t.timestamps
    end
  end
end
