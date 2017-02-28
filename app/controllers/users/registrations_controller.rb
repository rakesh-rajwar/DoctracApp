class Users::RegistrationsController < Devise::RegistrationsController
 respond_to :json
  respond_to :html, only: []
  respond_to :xml, only: []

  before_action :inject_status_value, only: [:create]
  before_filter :not_allowed, only: [:new, :edit, :cancel]

  def not_allowed
    raise MethodNotAllowed
  end

  private

  def sign_up_params
    params.require(:user).permit([
      :email,
      :password,
      :password_confirmation,
      :status
    ])
  end

  def account_update_params
    params.require(:user).permit([
      :email,
      :status
    ])
  end

  def inject_status_value
    params[:user][:status] = "REGISTRATION_COMPLETED"
  end
end
