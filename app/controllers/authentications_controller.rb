# encoding: utf-8

class AuthenticationsController < ApplicationController

  def callback
    raise omniauth.to_yaml
  end

  def failure
    flash[:alert] = "Таны хүсэлтээр нэвтрэх процесс цуцлагдлаа."
    redirect_to root_url
  end

  protected
    def omniauth
      request.env["omniauth.auth"]
    end
end
