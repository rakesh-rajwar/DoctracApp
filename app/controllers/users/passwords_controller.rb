class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    user = User.find_by(email: password_reset_params[:email])
    if user.present?
     user.send_reset_password_instructions
     render json: {responseMessage: "Password reset instructions sent to your email."},  status: :ok 
    else
      render json: { error: "Email not found" }, status: :unprocessable_entity
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  private

  def password_reset_params
    params.require(:user).permit(:email)
  end

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
