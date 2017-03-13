class Api::V1::DiseasesController < ApiController

  def search
  	disease_list = Disease.search_by_name(params[:q])
  	render json: disease_list
  end

  def add_to_patient
  	diseases = Disease.where(id: params[:id])
  	current_resource_owner << diseases
  	render json: responseMessage: "Diseases added to your profile successfully.", status: :ok 
  end
end
