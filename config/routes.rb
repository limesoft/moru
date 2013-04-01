# encoding: utf-8

Moru::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root to: 'posts#index'

  # Omniauth
  match "/auth/:provider/callback" => "authentications#callback"
  match "/auth/failure" => "authentications#failure"
  match 'logout' => 'authentications#logout', as: 'logout'
  match 'announcements/:id/hide' => 'announcements#hide', as: 'hide_announcement'

  #resources :events, only: [:index, :show] do
  #  resources :comments, only: [:create, :index]
  #end
  resources :topics, only: [:index, :create, :show] do
    put :assign, on: :member
    put :unassign, on: :member
    put :upvote, on: :member
    put :downvote, on: :member
    resources :comments, only: [:create, :index]
  end
  resources :rsvps, only: [:create]
  resources :feedbacks, only: [:create]
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create, :index]
  end

  resources :comments, only: [:destroy, :update]
  resources :profiles, only: [:show, :update]
  resources :screencasts, only: [:index, :show] do
    resources :comments, only: [:create, :index]
  end

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#not_found'
  end

end
