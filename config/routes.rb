Rails.application.routes.draw do
  get 'admin/pending'

  get 'admin/disapproved'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :menus
  resources :items
  resources :admin
  post '/items/:id/upload' => 'items#upload_picture', as: 'image_upload'
  get '/items/:id/first_image' => 'items#serve_first_image'
  post '/images/:id/approve' => 'images#approve', as: 'image_approve'
  post '/images/:id/disapprove' => 'images#disapprove', as: 'image_disapprove'
  get '/pending' => 'admin#pending'
  get '/disapproved' => 'admin#disapproved'
  get '/adminuser' => 'admin#adminuser'
  post '/items/:id/add_to_preferences' => 'items#add_to_preferences', as: 'add_to_preferences'
  post '/items/:id/remove_from_preferences' => 'items#remove_from_preferences', as: 'remove_from_preferences'
  put '/admin/:id' => 'admin#update', as: 'update'
  root 'menus#index'
  %w( 403 404 422 500 503).each do |code|
    get code, :to => 'errors#show', :code => code
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
