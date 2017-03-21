class Api::V1::AllergiesController < ApiController

  def search
  	allergy_list = Allergy.search_by_name(params[:q])
  	render json: allergy_list
  end

  def add_to_patient
  	allergies = Allergy.where(id: params[:ids])
  	current_resource_owner.allergies << allergies
  	render json: {responseMessage: "Allergies added to your profile successfully."}
  end

  def index
    allergy_list = current_resource_owner.allergies
    render json: allergy_list
  end
end
