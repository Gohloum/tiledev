TileSqlite::Application.routes.draw do
  #resources :m3_boards

  #resources :m3_levels

  #resources :game_types do
  #  resources :projects do
  #    resources :m3_levels
  #  end
  #end

  match '/game_types', to: 'game_types#index', via: :get

  match '/projects/create', to: 'projects#create', via: :post
  match '/projects/update', to: 'projects#update', via: :post
  match '/projects', to: 'projects#index', via: :get

  match '/m3_levels/create', to: 'm3_levels#create', via: :post
  match '/m3_levels', to: 'm3_levels#get_levels_by_project_id', via: :get
  match '/m3_level', to: 'm3_levels#get_level_by_id', via: :get
  match '/m3_level/update_name', to: 'm3_levels#update_name', via: :post
  match '/m3_level/update_data', to: 'm3_levels#update_data', via: :post
  match '/m3_level/update_order', to: 'm3_levels#update_order', via: :post
  match '/m3_level/update_icons', to: 'm3_levels#update_icons', via: :post
  match '/m3_level/update_active', to: 'm3_levels#update_active', via: :post
  match '/m3_level/destroy', to: 'm3_levels#destroy', via: :post
  match '/m3_level/copy', to: 'm3_levels#copy', via: :post

  match '/m3_board/get_data', to: 'm3_boards#get_data', via: :get
  match '/m3_board/update_data', to: 'm3_boards#update_data', via: :get



  #resources :projects
  #resources :game_types

  #resources :game_engines

  #get ':controller/:action/:id/:game_type_id/:limit'
  #get ':controller/:action/:id'
  #get ':controller/:action/'

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
