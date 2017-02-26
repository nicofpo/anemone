# frozen_string_literal: true
Rails.application.routes.draw do
  mount Peek::Railtie => '/peek'

  root to: 'static#top_page'

  get '/auth/:provider/callback', :to => 'user/sessions#callback'
  post '/auth/:provider/callback', :to => 'user/sessions#callback'
  delete '/logout', :to => 'user/sessions#destroy', :as => :logout

  get '/timeline', to: 'timeline#users', as: :users_timeline
  get '/timeline/tags', to: 'timeline#tags', as: :tags_timeline
  get '/timeline/all', to: 'timeline#all', as: :all_timeline

  namespace :api do
    resources :videos, only: %i(create)
  end

  resources :users, only: %i(destroy)

  resources :settings, only: [] do
    collection do
      get :users
      post :users, action: :add_user
      delete "users/:nid", action: :del_user
      get :tags
      post :tags, action: :add_tag
      delete "tags/:name", action: :del_tag
      get :etc
    end
  end
end
