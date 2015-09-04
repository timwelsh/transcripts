Rails.application.routes.draw do
  get 'stripe/webhook'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users
  resources :homes do 
    collection do
      get 'dashboard'
    end
  end
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
    :passwords => "user/passwords"
  }

  authenticated :user do
    devise_scope :user do
      #root 'user/registrations#edit'
      
      root :to => 'homes#index'

    end

  end 
  #get 'homes/dashboard', to:'homes#dashboard', as: :dashboard 
  unauthenticated :user do
    devise_scope :user do
      # get "/" => "user/sessions#new"
      get "/" => "homes#index"
    end
  end
  
  post 'stripe/webhook'
  get '/homes/about'
#get 'registrations/checkemail'
get '/schools/subregion_options' => 'schools#subregion_options'
get '/students/subregion_options' => 'students#subregion_options'
  #get '/schools/:school_id/students/subregion_options' => 'students#subregion_options'
  devise_scope :user do
    get '/user/registrations/subregion_options' => 'user/registrations#subregion_options'
  end
  get '/students/:id/view_pdf', to: 'students#view_pdf', as: :view_pdf
  get '/students/checkemail', to: 'students#checkemail', as: :checkemail
  get 'schools/user_detail_copy'
  get 'schools/school_detail_copy'
  
  resources :schools do
    resources :students    
  end

  controller :pages do
    get :about
    get :contact
  end
  #post 'transactions/hook'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  
  resources :subscriptions
  resources :plans
  resources :transactions

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
