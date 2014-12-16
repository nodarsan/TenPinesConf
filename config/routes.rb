Rails.application.routes.draw do
  devise_for :speaker_users
  root 'template#index'
  get 'template/:name' => 'template#get'

  get 'talk_list' => 'talk_list#all_talks'
  get 'my_talks' => 'my_talks_list#my_talks'
  get 'talk/:id' => 'my_talks_list#talk'
  get 'talk_config' => 'talk_config#get'
  post 'register_talk' => 'register_talk#new'
  post 'edit_talk' => 'register_talk#edit'
  post 'register_speaker' => 'speaker_auth#sign_up'
  post 'login' => 'speaker_auth#login'
  get 'logged_user' => 'speaker_auth#logged_user'
  get 'log_out' => 'speaker_auth#logout'


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
