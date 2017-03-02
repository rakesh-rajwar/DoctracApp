class AddPoaAddressToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :poa_address, :text
  end
end
