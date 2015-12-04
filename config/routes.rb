Rails.application.routes.draw do
  get 'pages/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  # Pages
  get '/index.html' => 'pages#home'
  get '/pitch' => 'pages#pitch'
  get '/pitch.html' => 'pages#pitch'
  get '/events' => 'pages#events'
  get '/map' => 'pages#map'
  get '/resources' => 'pages#resources'
  # Tweet Stream
  get '/happening-now' => 'tweet_map#map'
  get '/happening-now/map-view' => 'tweet_map#map'
  get '/happening-now/list-view' => 'tweet_map#list'

  # Candidates
  get '/candidates/genericcandidate' => 'candidates#genericcandidate'
  get '/candidates/berniesanders' => 'candidates#berniesanders'
  get '/candidates/donaldtrump' => 'candidates#donaldtrump'
  get '/candidates/hillaryclinton' => 'candidates#hillaryclinton'
  get '/candidates/bencarson' => 'candidates#bencarson'
  get '/candidates/marcorubio' => 'candidates#marcorubio'
  get '/candidates/martinomalley' => 'candidates#martinomalley'
  get '/candidates/carlyfiorina' => 'candidates#carlyfiorina'
  get '/candidates/tedcruz' => 'candidates#tedcruz'


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
