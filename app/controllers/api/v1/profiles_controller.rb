class Api::V1::ProfilesController < ApiController

  def show
    profile = current_resource_owner.profile
    render json: profile
  end

  def create
    profile = Profile.new(profile_params)
    profile.user = current_resource_owner
    if profile.save
      render json: profile, status: :created
    else
      render json: { error: profile.errors }, status: :unprocessable_entity
    end
  end

  def update
    profile = current_resource_owner.profile
    if profile.update(profile_params)
      render json: profile
    else
      render json: {error: profile.errors}, status: :unprocessable_entity
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :middle_name, :dob, :gender, :address, :state, :city, :zip_code, :cell_phone, :home_phone, :office_phone, :fax, :code_status, :emergency_contact_name1, :emergency_contact_phone1, :emergency_contact_address1, :emergency_contact_name2, :emergency_contact_phone2, :emergency_contact_address2, :poa_name, :poa_phone, :poa_email, :pharmacy_name, :pharmacy_phone, :pharmacy_address, :primary_insurance_name, :primary_insurance_plocy_number, :primary_insurance_group_number, :primary_insurance_coverage_limits, :primary_insurance_deductible, :primary_insurance_copay, :primary_insurance_coinsurance, :primary_insurance_out_of_network_fee, :secondary_insurance_name, :secondary_insurance_plocy_number, :secondary_insurance_group_number, :secondary_insurance_coverage_limits, :secondary_insurance_deductible, :secondary_insurance_copay, :secondary_insurance_coinsurance, :secondary_insurance_out_of_network_fee, :tertiary_insurance_name, :tertiary_insurance_plocy_number, :tertiary_insurance_group_number, :tertiary_insurance_coverage_limits, :tertiary_insurance_deductible, :tertiary_insurance_copay, :tertiary_insurance_coinsurance, :tertiary_insurance_out_of_network_fee)
    end
end