CSBTV1::Application.routes.draw do
  devise_for :users,
             :controllers => { :registrations => 'users', :sessions => 'sessions' },
             :skip => [:registrations, :sessions]
  as :user do
    get '/login' => 'sessions#new', :as => :new_user_session_path
    post '/login' => 'sessions#create', :as => :user_session_path
    delete '/logout' => 'sessions#destroy', :as => :destroy_user_session_path

    get '/register' => 'users#new', :as => :new_user_registration_path
    post '/register' => 'users#create', :as => :user_registration_path
    delete '/cancel' => 'users#destroy'

    get '/bowlers' => 'bowlers#index', :as => :bowler_path
    get '/bowler/:lastname.:firstname' => 'bowlers#show', :as => :bowler_show_path
    put '/bowler/:lastname.:firstname' => 'bowlers#update', :as => :bowler_update_path
    get '/bowler/:lastname.:firstname/edit' => 'bowlers#edit', :as => :bowler_edit_path
    get '/bowlers/new' => 'bowlers#new', :as => :bowler_new_path
    post '/bowlers' => 'bowlers#create', :as => :bowler_create_path
    get '/badboy' => 'bowlers#badboy', :as => :bowler_badboy_path

    get '/tournaments' => 'tournaments#index', :as => :tournament_season_path
    get '/tournament/:id' => 'tournaments#show', :as => :tournament_show_path
    get '/tournaments/new' => 'tournaments#new', :as => :tournament_new_path
    post '/tournaments/new' => 'tournaments#create', :as => :tournament_create_path
    get '/tournaments/edit' => 'tournaments#edit', :as => :tournament_edit_path
    get '/tournaments/direct' => 'tournaments#direct', :as => :tournament_direct_path
    get '/badboy' => 'tournaments#badboy', :as => :bowler_badboy_path

    get '/oil_patterns' => 'oil_patterns#index', :as => :oil_pattern_path
    post '/oil_patterns/new' => 'oil_patterns#create', :as => :oil_pattern_create_path
    post '/oil_patterns/update' => 'oil_patterns#update', :as => :oil_pattern_update_path

    get '/bowling_centers' => 'bowling_centers#index', :as => :bowling_center_path
    post '/bowling_centers/new' => 'bowling_centers#create', :as => :bowling_center_create_path
    post '/bowling_centers/update' => 'bowling_centers#update', :as => :bowling_center_update_path

    get '/records/' => 'records#index', :as => :record_path
    get '/records/choose' => 'records#choose', :as => :record_choose_path
    get '/records/scoring' => 'records#scoring', :as => :record_scoring_path
    get '/records/season' => 'records#season', :as => :record_season_path
    get '/records/career' => 'records#career', :as => :record_career_path
    get '/records/achievements' => 'records#achievements', :as => :record_achievements_path
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
