CSBTV1::Application.routes.draw do
  devise_for :bowlers,
             :controllers => { :registrations => 'bowlers', :sessions => 'sessions' },
             :skip => [:registrations, :sessions]
  as :bowler do
    get '/login' => 'sessions#new', :as => :new_bowler_session
    post '/login' => 'sessions#create', :as => :bowler_session
    delete '/logout' => 'sessions#destroy', :as => :destroy_bowler_session

    get '/register' => 'bowlers#new', :as => :new_bowler_registration
    post '/register' => 'bowlers#create', :as => :bowler_registration
    delete '/cancel' => 'bowlers#destroy'

    get '/profile/:lastname.:firstname' => 'bowlers#show', :as => :bowler_show
    put '/profile/:lastname.:firstname' => 'bowlers#update', :as => :bowler_update
    get '/profile/:lastname.:firstname/edit' => 'bowlers#edit', :as => :bowler_edit

    get '/badboy' => 'bowlers#badboy', :as => :bowler_badboy
  end

  root :to => 'home#index'


  #resources :bowlers

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with 'root'
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with 'rake routes'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
