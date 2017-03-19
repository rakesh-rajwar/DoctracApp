class Api::V1::InsurancesController < ApiController

  # GET /insurance.json
  def show
    @insurance = current_resource_owner.insurance
    render json: @insurance
  end

  # POST /insurance.json
  def create
    @insurance = Insurance.find_or_initialize_by(user_id: current_resource_owner.id)
    if @insurance.update(insurance_params)
      render json: @insurance, status: :created, responseMessage: 'Insurance was successfully created.'
    else
      e = @insurance.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Insurance not saved."
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_params
      params.require(:insurance).permit(:primary_name, :primary_plocy_number, :primary_group_number, :primary_coverage_limits, 
              :primary_deductible, :primary_copay, :primary_coinsurance, :primary_out_of_network_fee, 
              :secondary_name, :secondary_plocy_number, :secondary_group_number, :secondary_coverage_limits, 
              :secondary_deductible, :secondary_copay, :secondary_coinsurance, :secondary_out_of_network_fee, 
              :tertiary_name, :tertiary_plocy_number, :tertiary_group_number, :tertiary_coverage_limits, 
              :tertiary_deductible, :tertiary_copay, :tertiary_coinsurance, :tertiary_out_of_network_fee)
    end
end
