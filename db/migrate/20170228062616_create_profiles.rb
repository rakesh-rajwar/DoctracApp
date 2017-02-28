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
      t.integer :cell_phone
      t.integer :home_phone
      t.integer :office_phone
      t.integer :fax
      t.string :code_status
      t.string :emergency_contact_name1
      t.integer :emergency_contact_phone1
      t.text :emergency_contact_address1
      t.string :emergency_contact_name2
      t.integer :emergency_contact_phone2
      t.text :emergency_contact_address2
      t.string :poa_name
      t.integer :poa_phone
      t.string :poa_email
      t.string :pharmacy_name
      t.integer :pharmacy_phone
      t.text :pharmacy_address
      t.string :primary_insurance_name
      t.integer :primary_insurance_plocy_number
      t.integer :primary_insurance_group_number
      t.integer :primary_insurance_coverage_limits
      t.integer :primary_insurance_deductible
      t.integer :primary_insurance_copay
      t.integer :primary_insurance_coinsurance
      t.integer :primary_insurance_out_of_network_fee
      t.string  :secondary_insurance_name
      t.integer :secondary_insurance_plocy_number
      t.integer :secondary_insurance_group_number
      t.integer :secondary_insurance_coverage_limits
      t.integer :secondary_insurance_deductible
      t.integer :secondary_insurance_copay
      t.integer :secondary_insurance_coinsurance
      t.integer :secondary_insurance_out_of_network_fee
      t.string  :tertiary_insurance_name
      t.integer :tertiary_insurance_plocy_number
      t.integer :tertiary_insurance_group_number
      t.integer :tertiary_insurance_coverage_limits
      t.integer :tertiary_insurance_deductible
      t.integer :tertiary_insurance_copay
      t.integer :tertiary_insurance_coinsurance
      t.integer :tertiary_insurance_out_of_network_fee
	  t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
