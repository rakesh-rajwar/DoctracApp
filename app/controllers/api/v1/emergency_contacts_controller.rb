class Api::V1::EmergencyContactsController < ApiController

  # GET /emergency_contacts/1.json
  def index
    @emergency_contact = current_resource_owner.emergency_contact
    render json: @emergency_contact
  end

  # POST /emergency_contacts.json
  def create
    @emergency_contact = EmergencyContact.find_or_initialize_by(user_id: current_resource_owner.id)
    if @emergency_contact.update(emergency_contact_params)
      render json: @emergency_contact, status: :created, responseMessage: 'Emergency contact was successfully created.'
    else
      e = @emergency_contact.errors.first
      error = e[0].to_s+" "+e[1].to_s rescue "Emergency contact not saved."
      render json: {error: error}, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_contact_params
      params.require(:emergency_contact).permit(:name1, :phone1, :address1, :state1, :city1, :zip_code1, :name2, :phone2, :address2, :state2, :city2, :zip_code2)
    end
end
