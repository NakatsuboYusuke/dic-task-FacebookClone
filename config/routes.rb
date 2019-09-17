Rails.application.routes.draw do
  root to: 'homes#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
