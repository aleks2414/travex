Rails.application.routes.draw do

  resources :blocks
  resources :images
  resources :experiences
  get 'viajes_corporativos' => 'pages#corporativos'

  resources :contacts, only: [:new, :create]
	mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
