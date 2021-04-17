Rails.application.routes.draw do
  resources :waste_category, :waste_collection_point, :location_category

  resource :waste_category do
    member do
      get :barcode
    end
  end
end
