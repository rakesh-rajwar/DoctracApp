Rails.application.routes.draw do

  root 'welcome#index'
  # Doorkeeper
  use_doorkeeper do
    controllers :tokens => 'custom_tokens'
  end

  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :profile do
        get :get_cities, on: :collection
      end
      resources :images do
        collection do
          post :avatar, action: 'avatar_create'
          post :photo_id, action: 'photo_id_create'
          get :avatar
          get :photo_id
        end
      end
      get 'diseases/search'
      post 'diseases/add_to_patient'
    end
  end
end
