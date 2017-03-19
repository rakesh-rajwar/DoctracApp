class Api::V1::ProfilesController < ApiController

  def show
    @profile = current_resource_owner.profile
    render json: @profile
  end

 # POST /api/v1/profile, profile save and update both.
  def create
    @profile = Profile.find_or_initialize_by(user_id: current_resource_owner.id)
    if @profile.update(profile_params)
      render json: @profile, status: :created
    else
      e = @profile.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Profile not saved."
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  
 # /api/v1/profile/get_cities?state=Alaska
  def get_cities
    render json: CS.cities(CS.states(:us).key(params[:state]), :us)
  end

  # def update
  #   profile = current_resource_owner.profile
  #   if profile.update(profile_params)
  #     render json: profile
  #   else
  #     e = profile.errors.first
  #     error = e[0].to_s+" "+e[1].to_s rescue "Not saved"
  #     render json: {error: error}, status: :unprocessable_entity
  #   end
  # end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :middle_name, :dob, :gender, :address, 
        :state, :city, :zip_code, :cell_phone, :home_phone, :office_phone, :fax, :code_status)
    end
end
