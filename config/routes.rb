Rails.application.routes.draw do

  root 'welcome#index'
  # Doorkeeper
  use_doorkeeper do
    controllers :tokens => 'custom_tokens'
  end

  devise_for :users,
  controllers: {
    registrations: 'users/registrations'
  }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :profile
    end
  end
end
