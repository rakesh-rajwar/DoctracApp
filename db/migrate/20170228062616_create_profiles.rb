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
      t.string :emergency_contact_name1
      t.string :emergency_contact_phone1
      t.text :emergency_contact_address1
      t.string :emergency_contact_state1
      t.string :emergency_contact_city1
      t.integer :emergency_contact_zip_code1
      t.string :emergency_contact_name2
      t.string :emergency_contact_phone2
      t.text :emergency_contact_address2
      t.string :emergency_contact_state2
      t.string :emergency_contact_city2
      t.integer :emergency_contact_zip_code2
      t.string :poa_name
      t.string :poa_phone
      t.string :poa_email
      t.string :poa_address
      t.string :poa_address_state
      t.string :poa_address_city
      t.integer :poa_address_zip_code
      t.string :pharmacy_name
      t.string :pharmacy_phone
      t.text :pharmacy_address
      t.string :pharmacy_state
      t.string :pharmacy_city
      t.integer :pharmacy_zip_code
      t.string :primary_insurance_name
      t.string :primary_insurance_plocy_number
      t.string :primary_insurance_group_number
      t.string :primary_insurance_coverage_limits
      t.string :primary_insurance_deductible
      t.string :primary_insurance_copay
      t.string :primary_insurance_coinsurance
      t.string :primary_insurance_out_of_network_fee
      t.string  :secondary_insurance_name
      t.string :secondary_insurance_plocy_number
      t.string :secondary_insurance_group_number
      t.string :secondary_insurance_coverage_limits
      t.string :secondary_insurance_deductible
      t.string :secondary_insurance_copay
      t.string :secondary_insurance_coinsurance
      t.string :secondary_insurance_out_of_network_fee
      t.string  :tertiary_insurance_name
      t.string :tertiary_insurance_plocy_number
      t.string :tertiary_insurance_group_number
      t.string :tertiary_insurance_coverage_limits
      t.string :tertiary_insurance_deductible
      t.string :tertiary_insurance_copay
      t.string :tertiary_insurance_coinsurance
      t.string :tertiary_insurance_out_of_network_fee
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
