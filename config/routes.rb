Rails.application.routes.draw do
  # Doorkeeper
  use_doorkeeper do
    controllers :tokens => 'custom_tokens'
  end

  devise_for :users,
  controllers: {
    registrations: 'users/registrations'
  }

end
