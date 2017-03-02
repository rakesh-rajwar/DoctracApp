class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /users/confirmation
  def create
    user = User.find_by(email: account_confirmation_params[:email])
    if user.present?
     user.send_confirmation_instructions
     render json: {responseMessage: "You will receive an email with instructions for how to confirm your email address in a few minutes."},  status: :ok 
    else
      render json: { error: "Email not found" }, status: :unprocessable_entity
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end
  private

  def account_confirmation_params
    params.require(:user).permit(:email)
  end

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
