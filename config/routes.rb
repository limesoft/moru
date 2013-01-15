# encoding: utf-8

Moru::Application.routes.draw do

  root to: 'home#index'

  # Omniauth
  match "/auth/:provider/callback" => "authentications#callback"
  match "/auth/failure" => "authentications#failure"
  match 'logout' => 'authentications#logout', as: 'logout'

  resources :events, only: [:index, :show]
  resources :topics, only: [:index, :create] do
    put :assign, on: :member
    put :unassign, on: :member
  end
  resources :rsvps, only: [:create]
  resources :posts, only: [:index, :show]

end
