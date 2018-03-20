Rails.application.routes.draw do

  resources :experiences
  get 'viajes_corporativos' => 'pages#corporativos'

  get 'contacts/new'

  get 'contacts/create'

  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
