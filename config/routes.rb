Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#show'
  get 'welcome/show'
  #root 'blogs#index'
  resources :articles do
  resources :comments 
  #resources :blogs do
  #resources :comment1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#end
end
end
