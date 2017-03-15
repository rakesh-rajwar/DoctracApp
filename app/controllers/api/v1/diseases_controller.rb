class Api::V1::DiseasesController < ApiController

  def search
  	disease_list = Disease.search_by_name(params[:q])
  	render json: disease_list
  end

  def add_to_patient
  	diseases = Disease.where(id: params[:ids])
  	current_resource_owner.diseases << diseases
  	change_user_status
  	render json: {responseMessage: "Diseases added to your profile successfully."}
  end

  private

    def change_user_status
      if current_resource_owner.status == "PHOTO_COMPLETE"
        current_resource_owner.update(status: "ONBOARDING_COMPLETE")
      end
    end
end
