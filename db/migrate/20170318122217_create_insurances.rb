class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.string :primary_name
      t.string :primary_plocy_number
      t.string :primary_group_number
      t.string :primary_coverage_limits
      t.string :primary_deductible
      t.string :primary_copay
      t.string :primary_coinsurance
      t.string :primary_out_of_network_fee
      t.string :secondary_name
      t.string :secondary_plocy_number
      t.string :secondary_group_number
      t.string :secondary_coverage_limits
      t.string :secondary_deductible
      t.string :secondary_copay
      t.string :secondary_coinsurance
      t.string :secondary_out_of_network_fee
      t.string :tertiary_name
      t.string :tertiary_plocy_number
      t.string :tertiary_group_number
      t.string :tertiary_coverage_limits
      t.string :tertiary_deductible
      t.string :tertiary_copay
      t.string :tertiary_coinsurance
      t.string :tertiary_out_of_network_fee
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
