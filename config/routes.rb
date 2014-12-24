Rails.application.routes.draw do
  devise_for :attendee_users
  devise_for :attendees
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
  post 'login_speaker' => 'speaker_auth#login'
  get 'logged_speaker' => 'speaker_auth#logged_user'
  get 'logout_speaker' => 'speaker_auth#logout'
  post 'payment' => 'payment#pay'
  get 'logout_attendee' => 'attendee_auth#logout'
  get 'logged_attendee' => 'attendee_auth#logged_user'
  post 'login_attendee' => 'attendee_auth#login'
  post 'register_attendee' => 'attendee_auth#sign_up'
  post 'forgot_password_speaker' => 'speaker_auth#new_password'
  post 'forgot_password_attendee' => 'attendee_auth#new_password'
  post 'edit_password_speaker' => 'speaker_auth#edit_password'
  post 'edit_password_attendee' => 'attendee_auth#edit_password'

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
