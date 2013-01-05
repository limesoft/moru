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

  protected
    def warden
      env['warden']
    end

  private
    def current_user
      warden.user
    end
    helper_method :current_user

    def user_signed_in?
      warden.authenticated? && current_user.user?
    end
    helper_method :user_signed_in?
end
