AutoTest::Application.routes.draw do
  devise_for :users

  resources :test_plan_cases


  resources :test_plans


  resources :flow_date_types


  resources :flow_types


  resources :test_case_flows


  resources :test_cases 

  match 'home/index' => 'home#index'
  
  get '/test_plan_case/get_data' => "test_plan_cases#get_data"
  post '/test_plan_case/set_data' => "test_plan_cases#set_data"


  get '/test_cases/:id/pro' => "test_cases#pro", :as => "pro_test_cases"

  get '/test_cases/:id/excuse' => "test_cases#excuse", :as => "excuse_test_cases"


  get '/test_plans/:id/excuse' => "test_plans#excuse", :as => "excuse_test_plan"

  get '/test_plans/:id/pause' => "test_plans#pause", :as => "pause_test_plan"

  get '/test_plans/:id/stop' => "test_plans#stop", :as => "stop_test_plan"

  get '/test_plans/:id/resume' => "test_plans#resume", :as => "resume_test_plan"




  get '/test_plans/:id/result' => "test_plans#result", :as => "result_test_plan"


  get '/test_plans/:id/pro' => "test_plans#pro", :as => "pro_test_plan"

  get '/test_plans/:id/script' => "test_plans#script", :as => "script_test_plan"


  root :to => 'home#index'

  
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # 

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
