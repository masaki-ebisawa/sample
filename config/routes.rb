Rails.application.routes.draw do
  get 'pages/link'
  root 'pages#link'
  get 'pages/help'
  root 'pages#index'
  get 'pages/index'
  root 'pages#index'
end
