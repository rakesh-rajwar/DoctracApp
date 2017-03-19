class InsuranceSerializer < ActiveModel::Serializer
  attributes :primary_name, :primary_plocy_number, :primary_group_number, :primary_coverage_limits, 
	:primary_deductible, :primary_copay, :primary_coinsurance, :primary_out_of_network_fee, 
	:secondary_name, :secondary_plocy_number, :secondary_group_number, :secondary_coverage_limits, 
	:secondary_deductible, :secondary_copay, :secondary_coinsurance, :secondary_out_of_network_fee, 
	:tertiary_name, :tertiary_plocy_number, :tertiary_group_number, :tertiary_coverage_limits, 
	:tertiary_deductible, :tertiary_copay, :tertiary_coinsurance, :tertiary_out_of_network_fee
end
