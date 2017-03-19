class Api::V1::PowerOfAttorneysController < ApiController

  # GET /power_of_attorney.json
  def show
    @power_of_attorney = current_resource_owner.power_of_attorney
    render json: @power_of_attorney
  end

  # POST /power_of_attorney.json
  def create
    @power_of_attorney = PowerOfAttorney.find_or_initialize_by(user_id: current_resource_owner.id)
    if @power_of_attorney.update(power_of_attorney_params)
      render json: @power_of_attorney, status: :created
    else
      e = @power_of_attorney.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Power Of Attorney not saved."
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_of_attorney_params
      params.require(:power_of_attorney).permit(:name, :phone, :email, :address, :state, :city, :zip_code)
    end
end
