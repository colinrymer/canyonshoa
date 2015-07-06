Rails.application.routes.draw do

  root to: "comfy/cms/content#show"
  get 'privacy' => 'high_voltage/pages#show', id: 'privacy'
  get 'terms' => 'high_voltage/pages#show', id: 'terms'

  get 'members', to: "users#index"


  resources :users, only: [:index, :show, :edit, :update] do
    put 'approve', on: :member
  end

  devise_for :admins, controllers: { registrations: "admin_registrations" }
  devise_for :users, skip: [:sessions, :registrations, :passwords]

  as :user do
    get 'signup' => 'devise/registrations#new', as: :new_user_registration
    post 'signup' => 'devise/registrations#create', as: :user_registration
    get 'signin' => 'devise/sessions#new', as: :new_user_session
    post 'signin' => 'devise/sessions#create', as: :user_session
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
    get '/reset-password' => 'devise/passwords#new', as: :new_user_password
    get '/reset-password/change' => 'devise/passwords#edit', as: :edit_user_password
    put  '/reset-password' => 'devise/passwords#update', as: :user_password
    post '/reset-password' => 'devise/passwords#create'
  end

  mount RailsAdmin::Engine => '/canyons-admin', as: 'rails_admin'
  mount Forem::Engine, at: '/forums'

  comfy_route :blog, path: '/news'
  comfy_route :blog_admin, path: '/admin'
  comfy_route :cms_admin, path: '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, path: '/', sitemap: false

end
