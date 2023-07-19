require 'sidekiq/web'

Rails.application.routes.draw do
  resources :legal_contents
  resources :prompts
  root to: 'legal_contents#index'
  mount Sidekiq::Web => "/sidekiq"
end
