Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'help-support', to: 'pages#helpsupport'
  get 'contact', to: 'pages#contact'
  resources :posts
end
