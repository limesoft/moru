# encoding: utf-8

Moru::Application.routes.draw do

  root to: 'home#index'

  # Omniauth
  match "/auth/:provider/callback" => "authentications#callback"
  match "/auth/failure" => "authentications#failure"
  match 'logout' => 'authentications#logout', as: 'logout'

  resources :events
  resources :topics
  resources :rsvps, only: [:create]
  resources :posts, only: [:index, :show]

end
