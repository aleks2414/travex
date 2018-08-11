Rails.application.routes.draw do

  resources :packages
  get 'orders/new'

  resources :blocks do 
  	resources :orders
    resources :packages
  end
  
  resources :images
  resources :experiences
  get 'viajes_corporativos' => 'pages#corporativos'
  get 'mis_experiencias' => 'pages#mis_experiencias'

  resources :contacts, only: [:new, :create]
	mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  root 'welcome#index'

  resources :orders, only: [:index]
  resources :packages, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
