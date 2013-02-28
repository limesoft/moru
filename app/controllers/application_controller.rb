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

  if Rails.env.production?
    unless Rails.application.config.consider_all_requests_local
      rescue_from ActionController::RoutingError, ActionController::UnknownController,
                  ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound,
                  with: ->(exception){ render_error(404, exception) }
      rescue_from Exception, with: ->(exception){ render_error(500, exception) }
    end
  end

  private
    def current_event
      @current_event ||= Event.last.extend GoingContext
    end
    helper_method :current_event

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def user_signed_in?
      current_user && current_user.user?
    end
    helper_method :user_signed_in?

    def render_error(status, exception)
      template = (status == 500 ? 'internal_server_error' : 'not_found')
      respond_to do |format|
        format.html { render template: "errors/#{template}", layout: 'layouts/application', status: status }
        format.all { render nothing: true, status: status }
      end
    end
end
