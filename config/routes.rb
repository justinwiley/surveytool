Surveytool::Application.routes.draw do
  root :to => "surveys#index"
  
  # recreate as sub resources?
  match 'survey/:id/remove_spoken' => 'surveys#remove_spoken', :as => :remove_spoken, :method => :delete
  match 'survey/:survey_id/question/:id/remove_spoken' => 'questions#remove_spoken', :as => :remove_question_spoken, :method => :delete
  match 'survey/:survey_id/question/:question_id/answer/:id/remove_spoken' => 'answers#remove_spoken', :as => :remove_answer_spoken, :method => :delete
  
  match 'current_survey/:id/administer' => 'current_surveys#administer', :as => 'administer_survey'
  match 'current_survey/:id/next_question' => 'current_surveys#next_question', :as => 'next_question'
  
  resources :surveys do
    resources :questions do
      resources :answers
    end
  end

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
