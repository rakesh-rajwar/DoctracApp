class Profile < ApplicationRecord
  belongs_to :user

  # Validations
  validates_presence_of :last_name, :first_name, :dob, :address, :gender, :state, :city, :zip_code, :cell_phone, :code_status, :emergency_contact_name1, :emergency_contact_phone1, :emergency_contact_address1, :poa_name, :poa_phone, :poa_email, :pharmacy_name, :pharmacy_phone, :pharmacy_address, :primary_insurance_name, :primary_insurance_plocy_number, :primary_insurance_group_number, :primary_insurance_coverage_limits, :primary_insurance_deductible, :primary_insurance_copay, :primary_insurance_coinsurance, :primary_insurance_out_of_network_fee, :emergency_contact_state1, :emergency_contact_city1, :emergency_contact_zip_code1, :poa_address, :poa_address_state, :poa_address_city, :poa_address_zip_code, :pharmacy_state, :pharmacy_city, :pharmacy_zip_code

  validates :user, presence: true, uniqueness: {
    message: "Profile already exists"
  }
end

