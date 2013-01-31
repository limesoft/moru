# encoding: utf-8

module ControllerHelper

  def login_in_as(user)
    controller.stub current_user: user
  end
end
