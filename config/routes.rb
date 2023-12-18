Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'help-support', to: 'pages#helpsupport'
  resources :posts
end
