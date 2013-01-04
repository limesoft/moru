# encoding: utf-8

class ApplicationController < ActionController::Base

  protect_from_forgery
  respond_to :html

  def current_ability
    @current_ability ||= Ability.for(current_user)
  end

  # Хэрэв эрх хүрэхгүй бол нүүр хуудас руу очуулна
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def user_signed_in?
      current_user.present?
    end
    helper_method :user_signed_in?
end
