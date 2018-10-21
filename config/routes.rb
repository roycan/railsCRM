Rails.application.routes.draw do
  get 'salutations/index'

  get 'countries/index'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	# resources :companies
	
		
	resources :companies do
	  resources :people
	end

	resources :people do
	  resources :salutations
	end
	
	resources :salutations
	resources :people
	
	resources :countries

	
	root 'welcome#index'

end
