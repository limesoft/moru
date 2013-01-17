# encoding: utf-8

Moru::Application.routes.draw do

  root to: 'home#index'

  # Omniauth
  match "/auth/:provider/callback" => "authentications#callback"
  match "/auth/failure" => "authentications#failure"
  match 'logout' => 'authentications#logout', as: 'logout'

  resources :events, only: [:index, :show] do
    resources :comments, only: [:create, :index]
  end
  resources :topics, only: [:index, :create] do
    put :assign, on: :member
    put :unassign, on: :member
    put :upvote, on: :member
    put :downvote, on: :member
  end
  resources :rsvps, only: [:create]
  resources :posts, only: [:index, :show]

end
