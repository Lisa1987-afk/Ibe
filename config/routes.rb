Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    resources :vegans do
     resources :likes, only: [:create, :destroy]
     resources :comments, only: [:create]
   end
  
   get 'vegan_info', to: 'vegans#vegan_info'
  end
  root 'vegans#index'
end
