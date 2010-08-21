Surveytool::Application.routes.draw do
  root :to => "surveys#index"
  
  scope 'survey/', :method => :delete do
    match ':id/remove_spoken' => 'surveys#remove_spoken', :as => :remove_spoken
    match ':survey_id/question/:id/remove_spoken' => 'questions#remove_spoken', :as => :remove_question_spoken
    match ':survey_id/question/:question_id/answer/:id/remove_spoken' => 'answers#remove_spoken', :as => :remove_answer_spoken
  end
  
  controller :current_survey do
    scope :method => :get do
      match '/:survey_id/show' => 'current_surveys#show', :as => 'show_current_survey'
      match '/:survey_id/finish' => 'current_surveys#finish', :as => 'finish'
    end
    scope :method => :post do
      match '/:survey_id/start' => 'current_surveys#start', :as => 'start_current_survey'
      match '/display_question' => 'current_surveys#display_question', :as => 'display_question'
    end
  end
  
  controller :reports do
    scope :method => :get do
      match '/reports/survey/:survey_id' => 'reports#survey', :as => 'show_survey_report'
      match '/reports/question/' => 'reports#question', :as => 'show_question_report'
    end
  end
  
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
