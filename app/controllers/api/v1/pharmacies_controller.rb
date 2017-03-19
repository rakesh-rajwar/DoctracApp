class Api::V1::PharmaciesController < ApiController

  # GET /pharmacy.json
  def show
    @pharmacy = current_resource_owner.pharmacy
    render json: @pharmacy
  end

  # POST /pharmacy.json
  def create
    @pharmacy = Pharmacy.find_or_initialize_by(user_id: current_resource_owner.id)
    if @pharmacy.update(pharmacy_params)
      render json: @pharmacy, status: :created
    else
      e = @pharmacy.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Pharmacy not saved."
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacy_params
      params.require(:pharmacy).permit(:name, :phone, :address, :state, :city, :zip_code)
    end
end
