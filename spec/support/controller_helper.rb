# encoding: utf-8

module ControllerHelper
  def login_in_as(user)
    controller current_user: user
  end
end
