Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'home', to: "pages#home"
  get 'faq', to: 'pages#faq'
  get 'documentation', to: 'pages#documentation'
  root 'pages#home'
end
