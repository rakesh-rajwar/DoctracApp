class Insurance < ApplicationRecord
	include Concerns::UserStatus
  belongs_to :user

  # Validations
  validates_presence_of :primary_name, :primary_plocy_number, :primary_group_number, :primary_coverage_limits, 
		:primary_deductible, :primary_copay, :primary_coinsurance, :primary_out_of_network_fee

  after_create :change_user_status
end
