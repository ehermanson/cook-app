Rails.application.routes.draw do

	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	devise_for :users
	resources :users, :only => [:show]
	resources :recipes

	get 'users/:id' => 'users#show'

	root "recipes#index"
end