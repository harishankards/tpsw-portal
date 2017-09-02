Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  authenticate :user, ->(user) { user.roles_mask == 1 } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/user/update_form' => 'user#update_form', as: 'force_update'
  post '/user/update_form' => 'user#save_update', as: ''
  get '/user/profile/:uid' => 'user#profile', as: 'users'
  post 'register' => 'home#register', as: 'register'

end
