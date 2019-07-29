Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'api/v1/users/sessions',
                 registrations: 'api/v1/users/registrations'
             }

  devise_scope :api_v1_user do
    get "/login_refresh" => "users/sessions#refresh_user_info"
  end

  namespace :api do #, :defaults => {:format => :json} do
    # =================
    # API v1 references
    # =================
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :pictures, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        collection do
          post :new
        end
      end
      root 'pictures#index'
      resources :projects, only: [:index, :show, :create, :update, :destroy]
      resources :potential_clients, only: [:index, :show, :create, :destroy]
    end
  end
end
