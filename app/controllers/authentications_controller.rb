# encoding: utf-8

class AuthenticationsController < ApplicationController

  def callback
    # raise request.env["omniauth.auth"].to_yaml
    if auth.authenticated?
      warden.set_user auth.user
      redirect_to root_url, notice: "Logged in."
    elsif user_signed_in?
      auth.add_authentication_to current_user
      redirect_to root_url, notice: "Logged in."
    else
      reset_session # protect from session fixation attack
      if auth.already_registered?
        redirect_to root_url, notice: "Таны \"#{omniauth.provider.capitalize}\" дээр бүртгэгдсэн \"#{omniauth.email}\" э-шуудангийн хаяг манай сайтанд бүртгэлтэй байна."
      elsif auth.register
        warden.set_user auth.user
        redirect_to root_url, notice: "Signed up."
      else
        redirect_to root_url, notice: "Алдаа гарсан тул та хэсэг хугацааны дараа дахин оролдоно уу"
      end
    end
  end

  def logout
    warden.logout
    redirect_to root_url, notice: "Logged out."
  end

  def failure
    flash[:alert] = "Таны хүсэлтээр нэвтрэх процесс цуцлагдлаа."
    redirect_to root_url
  end

  private
    def omniauth
      @omniauth ||= Omniauth.new(request.env["omniauth.auth"])
    end

    def auth
      @auth ||= AuthenticationService.new(omniauth)
    end
end
